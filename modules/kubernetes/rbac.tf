# RBAC configuration for namespace management
resource "kubernetes_cluster_role_v1" "namespace_manager" {
  metadata {
    name = "namespace-manager"
  }

  rule {
    api_groups = [""]
    resources  = ["namespaces"]
    verbs      = ["create", "get", "list", "update", "patch", "delete"]
  }
}

resource "kubernetes_cluster_role_binding_v1" "namespace_manager_binding" {
  metadata {
    name = "namespace-manager-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role_v1.namespace_manager.metadata[0].name
  }

  subject {
    kind      = "User"
    name      = "arn:aws:iam::904368994695:role/LabRole"
    api_group = "rbac.authorization.k8s.io"
  }
}
