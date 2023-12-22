# AWS VPCs (Azure Virtual Networks)

- On AWS by default you use a AWS public cloud: This is a building shared with everyone else using the public cloud.
- A default VPC is like a shared flat.
- A default subnet is like a room within the flat, associated with an availability zone.
- Routers utilised route tables which are private by default when creating a VPC and manage the connections.
- VPCs have an internet gateway, a door to the internet that can only be accessed by VMs in public subnets.
- CDIR blocks = 10.0.0.0/8 or 16 or 24 or 32 depending on how many bits we want to be locked.