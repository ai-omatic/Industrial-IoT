// ------------------------------------------------------------
//  Copyright (c) Microsoft Corporation.  All rights reserved.
//  Licensed under the MIT License (MIT). See License.txt in the repo root for license information.
// ------------------------------------------------------------

namespace Azure.IIoT.OpcUa.Publisher.Service.Tests.Services
{
    using Azure.IIoT.OpcUa.Publisher.Service;
    using Azure.IIoT.OpcUa.Publisher.Service.Services;
    using Azure.IIoT.OpcUa.Publisher.Service.Services.Models;
    using Azure.IIoT.OpcUa.Publisher.Models;
    using Autofac;
    using Autofac.Extras.Moq;
    using AutoFixture;
    using AutoFixture.Kernel;
    using Furly.Azure.IoT;
    using Furly.Azure.IoT.Mock.Services;
    using Furly.Azure.IoT.Models;
    using Furly.Exceptions;
    using Furly.Extensions.Serializers;
    using Furly.Extensions.Serializers.Newtonsoft;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using Xunit;

    public class EndpointRegistryTests
    {
        [Fact]
        public void GetTwinThatDoesNotExist()
        {
            CreateEndpointFixtures(out var site, out var super, out var endpoints, out var devices);

            using (var mock = AutoMock.GetLoose(builder =>
            {
                var hub = IoTHubMock.Create(devices, _serializer);
                // builder.RegisterType<NewtonSoftJsonConverters>().As<IJsonSerializerConverterProvider>();
                builder.RegisterType<NewtonsoftJsonSerializer>().As<IJsonSerializer>();
                builder.RegisterInstance(hub).As<IIoTHubTwinServices>();
            }))
            {
                IEndpointRegistry service = mock.Create<ApplicationRegistry>();

                // Run
                var t = service.GetEndpointAsync("test", false);

                // Assert
                Assert.NotNull(t.Exception);
                Assert.IsType<AggregateException>(t.Exception);
                Assert.IsType<ResourceNotFoundException>(t.Exception.InnerException);
            }
        }

        [Fact]
        public void GetTwinThatExists()
        {
            CreateEndpointFixtures(out var site, out var super, out var endpoints, out var devices);
            var first = endpoints[0];
            var id = EndpointInfoModelEx.CreateEndpointId(first.ApplicationId,
                first.Registration.EndpointUrl, first.Registration.Endpoint.SecurityMode,
                first.Registration.Endpoint.SecurityPolicy);

            using (var mock = AutoMock.GetLoose(builder =>
            {
                var hub = IoTHubMock.Create(devices, _serializer);
                // builder.RegisterType<NewtonSoftJsonConverters>().As<IJsonSerializerConverterProvider>();
                builder.RegisterType<NewtonsoftJsonSerializer>().As<IJsonSerializer>();
                builder.RegisterInstance(hub).As<IIoTHubTwinServices>();
            }))
            {
                IEndpointRegistry service = mock.Create<ApplicationRegistry>();

                // Run
                var result = service.GetEndpointAsync(id, false).Result;

                // Assert
                Assert.True(result.IsSameAs(endpoints[0]));
            }
        }

        [Fact]
        public void ListAllTwins()
        {
            CreateEndpointFixtures(out var site, out var super, out var endpoints, out var devices);

            using (var mock = AutoMock.GetLoose(builder =>
            {
                var hub = IoTHubMock.Create(devices, _serializer);
                // builder.RegisterType<NewtonSoftJsonConverters>().As<IJsonSerializerConverterProvider>();
                builder.RegisterType<NewtonsoftJsonSerializer>().As<IJsonSerializer>();
                builder.RegisterInstance(hub).As<IIoTHubTwinServices>();
            }))
            {
                IEndpointRegistry service = mock.Create<ApplicationRegistry>();

                // Run
                var records = service.ListEndpointsAsync(null, false, null).Result;

                // Assert
                Assert.True(endpoints.IsSameAs(records.Items));
            }
        }

        [Fact]
        public void ListAllTwinsUsingQuery()
        {
            CreateEndpointFixtures(out var site, out var super, out var endpoints, out var devices);

            using (var mock = AutoMock.GetLoose(builder =>
            {
                var hub = IoTHubMock.Create(devices, _serializer);
                // builder.RegisterType<NewtonSoftJsonConverters>().As<IJsonSerializerConverterProvider>();
                builder.RegisterType<NewtonsoftJsonSerializer>().As<IJsonSerializer>();
                builder.RegisterInstance(hub).As<IIoTHubTwinServices>();
            }))
            {
                IEndpointRegistry service = mock.Create<ApplicationRegistry>();

                // Run
                var records = service.QueryEndpointsAsync(null, false, null).Result;

                // Assert
                Assert.True(endpoints.IsSameAs(records.Items));
            }
        }

        [Fact]
        public void QueryTwinsBySignSecurityMode()
        {
            CreateEndpointFixtures(out var site, out var super, out var endpoints, out var devices);
            var count = endpoints.Count(x => x.Registration.Endpoint.SecurityMode == SecurityMode.Sign);

            using (var mock = AutoMock.GetLoose(builder =>
            {
                var hub = IoTHubMock.Create(devices, _serializer);
                // builder.RegisterType<NewtonSoftJsonConverters>().As<IJsonSerializerConverterProvider>();
                builder.RegisterType<NewtonsoftJsonSerializer>().As<IJsonSerializer>();
                builder.RegisterInstance(hub).As<IIoTHubTwinServices>();
            }))
            {
                IEndpointRegistry service = mock.Create<ApplicationRegistry>();

                // Run
                var records = service.QueryEndpointsAsync(new EndpointRegistrationQueryModel
                {
                    SecurityMode = SecurityMode.Sign
                }, false, null).Result;

                // Assert
                Assert.Equal(count, records.Items.Count);
            }
        }

        [Fact]
        public void QueryTwinsBySecurityPolicySameCase()
        {
            CreateEndpointFixtures(out var site, out var super, out var endpoints, out var devices);

            using (var mock = AutoMock.GetLoose(builder =>
            {
                var hub = IoTHubMock.Create(devices, _serializer);
                // builder.RegisterType<NewtonSoftJsonConverters>().As<IJsonSerializerConverterProvider>();
                builder.RegisterType<NewtonsoftJsonSerializer>().As<IJsonSerializer>();
                builder.RegisterInstance(hub).As<IIoTHubTwinServices>();
            }))
            {
                IEndpointRegistry service = mock.Create<ApplicationRegistry>();

                // Run
                var records = service.QueryEndpointsAsync(new EndpointRegistrationQueryModel
                {
                    SecurityPolicy = endpoints[0].Registration.Endpoint.SecurityPolicy
                }, false, null).Result;

                // Assert
                Assert.True(records.Items.Count >= 1);
                Assert.True(records.Items[0].IsSameAs(endpoints[0]));
            }
        }

        [Fact]
        public void QueryTwinsBySecurityPolicyDifferentCase()
        {
            CreateEndpointFixtures(out var site, out var super, out var endpoints, out var devices);

            using (var mock = AutoMock.GetLoose(builder =>
            {
                var hub = IoTHubMock.Create(devices, _serializer);
                // builder.RegisterType<NewtonSoftJsonConverters>().As<IJsonSerializerConverterProvider>();
                builder.RegisterType<NewtonsoftJsonSerializer>().As<IJsonSerializer>();
                builder.RegisterInstance(hub).As<IIoTHubTwinServices>();
            }))
            {
                IEndpointRegistry service = mock.Create<ApplicationRegistry>();

                // Run
                var records = service.QueryEndpointsAsync(new EndpointRegistrationQueryModel
                {
                    SecurityPolicy = endpoints[0].Registration.Endpoint.SecurityPolicy.ToUpperInvariant()
                }, false, null).Result;

                // Assert
                Assert.True(records.Items.Count == 0);
            }
        }

        [Fact]
        public void QueryTwinsByEndpointUrlDifferentCase()
        {
            CreateEndpointFixtures(out var site, out var super, out var endpoints, out var devices);

            using (var mock = AutoMock.GetLoose(builder =>
            {
                var hub = IoTHubMock.Create(devices, _serializer);
                // builder.RegisterType<NewtonSoftJsonConverters>().As<IJsonSerializerConverterProvider>();
                builder.RegisterType<NewtonsoftJsonSerializer>().As<IJsonSerializer>();
                builder.RegisterInstance(hub).As<IIoTHubTwinServices>();
            }))
            {
                IEndpointRegistry service = mock.Create<ApplicationRegistry>();

                // Run
                var records = service.QueryEndpointsAsync(new EndpointRegistrationQueryModel
                {
                    Url = endpoints[0].Registration.Endpoint.Url.ToUpperInvariant()
                }, false, null).Result;

                // Assert
                Assert.True(records.Items.Count >= 1);
                Assert.True(records.Items[0].IsSameAs(endpoints[0]));
            }
        }

        /// <summary>
        /// Helper to create app fixtures
        /// </summary>
        /// <param name="site"></param>
        /// <param name="super"></param>
        /// <param name="endpoints"></param>
        /// <param name="devices"></param>
        /// <param name="noSite"></param>
        private void CreateEndpointFixtures(out string site, out string super,
            out List<EndpointInfoModel> endpoints, out List<DeviceTwinModel> devices,
            bool noSite = false)
        {
            var fixture = new Fixture();
            fixture.Customizations.Add(new TypeRelay(typeof(IReadOnlySet<>), typeof(HashSet<>)));
            fixture.Customizations.Add(new TypeRelay(typeof(IReadOnlyList<>), typeof(List<>)));
            fixture.Customizations.Add(new TypeRelay(typeof(IReadOnlyDictionary<,>), typeof(Dictionary<,>)));
            fixture.Customizations.Add(new TypeRelay(typeof(IReadOnlyCollection<>), typeof(List<>)));
            fixture.Customizations.Add(new TypeRelay(typeof(VariantValue), typeof(VariantValue)));
            fixture.Behaviors.OfType<ThrowingRecursionBehavior>().ToList()
                .ForEach(b => fixture.Behaviors.Remove(b));
            fixture.Behaviors.Add(new OmitOnRecursionBehavior());
            var sitex = site = noSite ? null : fixture.Create<string>();
            var superx = super = fixture.Create<string>();
            endpoints = fixture
                .Build<EndpointInfoModel>()
                .Without(x => x.Registration)
                .Do(x => x.Registration = fixture
                    .Build<EndpointRegistrationModel>()
                    .With(y => y.SiteId, sitex)
                    .Create())
                .CreateMany(10)
                .ToList();

            devices = endpoints
                .ConvertAll(a =>
                {
                    a.Registration.EndpointUrl = a.Registration.Endpoint.Url;
                    var r = a.ToEndpointRegistration();
                    var t = r.ToDeviceTwin(_serializer);
                    var reported = new Dictionary<string, VariantValue>
                    {
                        [Constants.TwinPropertyTypeKey] = "Twin"
                    };
                    if (a.Registration.SiteId != null)
                    {
                        reported.Add(Constants.TwinPropertySiteKey, a.Registration.SiteId);
                    }
                    t.Reported = reported;
                    t.ConnectionState = "Disconnected";
                    return t;
                })
;
        }

        private readonly IJsonSerializer _serializer = new NewtonsoftJsonSerializer();
    }
}
