import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "@typespec/openapi";
import "@typespec/rest";
import "./models.tsp";
import "./Gallery.tsp";

using TypeSpec.Rest;
using Azure.ResourceManager;
using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace Microsoft.Compute;
/**
 * Specifies information about the gallery image definition that you want to create or update.
 */
@parentResource(Gallery)
model GalleryImage
  is Azure.ResourceManager.TrackedResource<GalleryImageProperties> {
  ...ResourceNameParameter<
    Resource = GalleryImage,
    KeyName = "galleryImageName",
    SegmentName = "images",
    NamePattern = ""
  >;
}

@armResourceOperations
interface GalleryImages {
  /**
   * Retrieves information about a gallery image definition.
   */
  get is ComputeResourceRead<GalleryImage>;

  /**
   * Create or update a gallery image definition.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-put-operation-response-codes" "For backward compatibility"
  #suppress "@azure-tools/typespec-azure-resource-manager/no-response-body" "For backward compatibility"
  createOrUpdate is ComputeResourceCreateOrReplaceAsync<
    GalleryImage,
    Response = ArmResourceUpdatedResponse<GalleryImage> | ArmResourceCreatedResponse<
      GalleryImage,
      ArmLroLocationHeader & Azure.Core.Foundations.RetryAfterHeader
    > | (ArmAcceptedLroResponse & {
      @bodyRoot
      _: GalleryImage;
    })
  >;

  /**
   * Update a gallery image definition.
   */
  @patch(#{ implicitOptionality: false })
  update is ArmCustomPatchAsync<
    GalleryImage,
    PatchModel = GalleryImageUpdate,
    Response = ArmResponse<GalleryImage> &
      ArmLroLocationHeader &
      Azure.Core.Foundations.RetryAfterHeader,
    Error = CloudError
  >;

  /**
   * Delete a gallery image.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-delete-operation-response-codes" "For backward compatibility"
  delete is ComputeResourceDeleteAsync<
    GalleryImage,
    Response = ArmDeletedResponse | ArmDeleteAcceptedLroResponse | ArmDeletedNoContentResponse
  >;

  /**
   * List gallery image definitions in a gallery.
   */
  listByGallery is ComputeResourceListByParent<
    GalleryImage,
    Response = ArmResponse<GalleryImageList>
  >;
}

@@doc(GalleryImage.name,
  "The name of the gallery image definition to be retrieved."
);
@@doc(GalleryImage.properties,
  "Describes the properties of a gallery image definition."
);
@@doc(GalleryImages.createOrUpdate::parameters.resource,
  "Parameters supplied to the create or update gallery image operation."
);
@@doc(GalleryImages.update::parameters.properties,
  "Parameters supplied to the update gallery image operation."
);
