/**
 * PLEASE DO NOT REMOVE - USED FOR CONVERTER METRICS
 * Generated by package: @autorest/openapi-to-typespec
 * Parameters used:
 *   isFullCompatible: true
 *   guessResourceKey: false
 * Version: 0.10.14
 * Date: 2025-04-23T08:08:08.106Z
 */
import "@typespec/rest";
import "@typespec/versioning";
import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "./models.tsp";
import "./StorageTask.tsp";
import "./routes.tsp";
import "./back-compatible.tsp";

using TypeSpec.Rest;
using TypeSpec.Http;
using Azure.ResourceManager.Foundations;
using Azure.Core;
using Azure.ResourceManager;
using TypeSpec.Versioning;
/**
 * The Azure Storage Actions Management API.
 */
@armProviderNamespace
@service(#{ title: "StorageActionsManagementClient" })
@versioned(Versions)
@armCommonTypesVersion(Azure.ResourceManager.CommonTypes.Versions.v5)
namespace Microsoft.StorageActions;

/**
 * The available API versions.
 */
enum Versions {
  /**
   * The 2023-01-01 API version.
   */
  @useDependency(Azure.ResourceManager.Versions.v1_0_Preview_1)
  @useDependency(Azure.Core.Versions.v1_0_Preview_1)
  v2023_01_01: "2023-01-01",
}

interface Operations extends Azure.ResourceManager.Operations {}

@@doc(Operations.list,
  "Lists all of the available Storage Actions Rest API operations."
);
