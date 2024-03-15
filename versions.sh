# Are you using podman or docker? If you have docker:
# c=docker
c=podman

# What version of Terraform to install 
TF_VER=1.3.10

# What versions of terragrunt to do performance testing
TG_VERS=(
    v0.43.3
#    v0.45.18
#    v0.46.3
#    v0.48.7
#    v0.49.1
#    v0.50.0
#    v0.50.5
#    v0.50.10
#    v0.50.11
#    v0.50.12
#    v0.50.13
    v0.50.14
    v0.50.15
#    v0.50.16    
#    v0.50.17
#    v0.51.7
#    v0.53.6
    v0.55.2
    v0.55.15
    v0.55.16
)

TG_VERS_TO_TEST=(terragrunt.v*)