﻿// ------------------------------------------------------------
//  Copyright (c) Microsoft Corporation.  All rights reserved.
//  Licensed under the MIT License (MIT). See License.txt in the repo root for license information.
// ------------------------------------------------------------

namespace Microsoft.Azure.IIoT.Auth.Azure {
    using System;
    using System.Security.Claims;

    public static class ClaimsPrincipalEx {

        /// <summary>
        /// Get identifier of the object targeted by the logged in principal's
        /// claim.
        /// </summary>
        /// <param name="principal"></param>
        /// <param name="throwIfNotFound"></param>
        /// <returns></returns>
        public static string GetObjectId(this ClaimsPrincipal principal,
            bool throwIfNotFound = true) => principal.FindFirstValue(
                "http://schemas.microsoft.com/identity/claims/objectidentifier",
                throwIfNotFound);

        /// <summary>
        /// Returns the audience id of the current claims principal targeted.
        /// As eveluating application, this is (one of) our configured clientid (s).
        /// </summary>
        /// <param name="principal"></param>
        /// <param name="throwIfNotFound"></param>
        /// <returns></returns>
        public static string GetAudienceId(this ClaimsPrincipal principal,
            bool throwIfNotFound = true) => principal.FindFirstValue(
                "aud", throwIfNotFound);

        /// <summary>
        /// Returns the scope for the current claims principal
        /// </summary>
        /// <param name="principal"></param>
        /// <param name="throwIfNotFound"></param>
        /// <returns></returns>
        public static string GetScope(this ClaimsPrincipal principal,
            bool throwIfNotFound = false) => principal.FindFirstValue(
                "http://schemas.microsoft.com/identity/claims/scope",
                throwIfNotFound);

        /// <summary>
        /// Helper to return a claim value
        /// </summary>
        /// <param name="principal"></param>
        /// <param name="claimType"></param>
        /// <param name="throwIfNotFound"></param>
        /// <returns></returns>
        public static string FindFirstValue(this ClaimsPrincipal principal,
            string claimType, bool throwIfNotFound = false) {
            var value = principal.FindFirst(claimType)?.Value;
            if (throwIfNotFound && string.IsNullOrWhiteSpace(value)) {
                throw new InvalidOperationException(
                    $"The supplied principal does not contain a claim of type {claimType}");
            }
            return value ?? string.Empty;
        }
    }
}
