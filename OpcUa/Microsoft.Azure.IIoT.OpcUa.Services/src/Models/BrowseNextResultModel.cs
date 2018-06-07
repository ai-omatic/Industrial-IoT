﻿// ------------------------------------------------------------
//  Copyright (c) Microsoft Corporation.  All rights reserved.
//  Licensed under the MIT License (MIT). See License.txt in the repo root for license information.
// ------------------------------------------------------------

namespace Microsoft.Azure.IIoT.OpcUa.Services.Models {
    using Newtonsoft.Json.Linq;
    using System.Collections.Generic;

    /// <summary>
    /// Result of node browse continuation
    /// </summary>
    public class BrowseNextResultModel {

        /// <summary>
        /// References, if included, otherwise null.
        /// </summary>
        public List<NodeReferenceModel> References { get; set; }

        /// <summary>
        /// Continuation token if more results pending.
        /// </summary>
        public string ContinuationToken { get; set; }

        /// <summary>
        /// Diagnostics in case of error
        /// </summary>
        public JToken Diagnostics { get; set; }
    }
}
