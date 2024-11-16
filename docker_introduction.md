# Introduction to Docker

## Port Range Guidelines:

1. Well-Known Ports (0-1023):
   These are reserved for common services and should be avoided for custom applications or Docker containers. Examples include:
   Port 80 (HTTP)
   Port 443 (HTTPS)
   Port 22 (SSH)
   These ports require administrative privileges to bind to.

2. Registered Ports (1024-49151):
   These are typically used by user-level applications and services. You can use ports in this range, but make sure they are not already allocated to other services running on the host system.
   For Docker containers, using ports in this range can be safe if you verify that the port isn’t in use.
3. Dynamic/Private Ports (49152-65535):
   These ports are primarily used as ephemeral ports for client-side applications, meaning the system can allocate them dynamically for outgoing connections. However, they are generally safe to use for custom applications like Docker containers as long as they are not already assigned by the operating system.
