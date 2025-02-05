resource "oci_core_vcn" "vcn" {
  count = local.provider_alias_value == "oci" ? 1 : 0
  compartment_id = var.compartment_id
}