# Azure Kubernetes Service (AKS) Terraform Deployment

This project uses Terraform to provision an Azure Kubernetes Service (AKS) cluster, along with an Azure Container Registry (ACR), and necessary role assignments for seamless Docker image pulls.

---

## 📦 Infrastructure Components

### ✅ Azure Resources Created:
- **Resource Group**
- **Azure Container Registry (ACR)**
- **Azure Kubernetes Service (AKS)**
- **Role Assignment** to allow AKS to pull from ACR
- **Kubeconfig** output to enable `kubectl` CLI access

---

## 📂 Project Structure

| File | Description |
|------|-------------|
| `main.tf` | Core infrastructure definitions |
| `variables.tf` | Declares variables used in the deployment |
| `terraform.tfvars` | Assigns values to input variables |
| `outputs.tf` | Outputs for use after provisioning (e.g., FQDN, kubeconfig) |
| `provider.tf` | Azure provider configuration |

---



## 🚀 How to Deploy

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Preview the changes:**
   ```bash
   terraform plan
   ```

3. **Apply the configuration:**
   ```bash
   terraform apply
   ```

---

## 📤 Outputs

After deployment, Terraform will provide:

- AKS Cluster ID
- AKS FQDN
- AKS Node Resource Group
- ACR ID
- ACR Login Server
- Kubeconfig (written to local `kubeconfig` file)

---

## 🔐 Security Notes

- ACR `admin_enabled` is set to `false` for security.
- AKS uses **system-assigned managed identity** for authentication.
- Role assignment uses the `AcrPull` role to allow AKS to pull images securely.

---

## ✅ Requirements

- Azure CLI authenticated session
- Terraform v1.3+ (compatible with `azurerm` provider 4.14.0)
- Azure subscription access with rights to create resources

