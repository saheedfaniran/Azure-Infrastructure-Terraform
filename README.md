# Azure Kubernetes Service (AKS) Terraform Deployment

This Terraform project provisions an Azure Kubernetes Service (AKS) cluster and an Azure Container Registry (ACR), and connects them through role assignments to allow seamless Docker image pulls from ACR into AKS.

---

## 📦 Infrastructure Components

### ✅ Azure Resources Created:
- **Resource Group**
- **Azure Container Registry (ACR)**
- **Azure Kubernetes Service (AKS)**
- **Role Assignment** to allow AKS to pull images from ACR
- **Kubeconfig** file (to enable local `kubectl` access to AKS)

---

## 📁 Project Structure

| File | Description |
|------|-------------|
| `main.tf` | Core infrastructure definition |
| `variables.tf` | Input variable declarations |
| `terraform.tfvars` | Actual values assigned to variables |
| `outputs.tf` | Output values after deployment |
| `provider.tf` | Azure provider configuration |

---

## ⚙️ Prerequisites

Ensure you have the following installed and set up:
- [Terraform](https://developer.hashicorp.com/terraform/downloads) v1.3+
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- An Azure Subscription

---

## 🚀 Step-by-Step Deployment Instructions

### Step 1: Clone the Repository

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

### Step 2: Authenticate with Azure

```bash
az login
```

(Optional if using multiple subscriptions):

```bash
az account set --subscription "<your-subscription-id>"
```

### Step 3: Initialize Terraform

```bash
terraform init
```

This will initialize the working directory and download the required providers.

### Step 4: Review the Execution Plan

```bash
terraform plan
```

This allows you to verify the resources that will be created before applying.

### Step 5: Apply the Configuration

```bash
terraform apply
```

Type `yes` when prompted to proceed.

---

## 📤 Outputs

After a successful deployment, Terraform will display:
- `aks_id` – The unique ID of the AKS cluster
- `aks_fqdn` – The fully qualified domain name of the AKS cluster
- `aks_node_rg` – The resource group where AKS node pools are provisioned
- `acr_id` – The Azure Container Registry ID
- `acr_login_server` – ACR server address used for image pulls
- A `kubeconfig` file generated locally for interacting with the AKS cluster

---

## ✅ Post-Deployment: Access AKS with kubectl

After deployment, use the generated `kubeconfig` file to access your cluster:

```bash
export KUBECONFIG=./kubeconfig
kubectl get nodes
```

---

## 🔐 Security Best Practices

- ACR `admin_enabled` is set to `false` to prevent unauthorized access.
- AKS uses **System-Assigned Managed Identity**.
- Role assignment uses `AcrPull` for scoped permissions.

---
