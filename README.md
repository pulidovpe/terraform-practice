## Terraform Practice
> Repositorio de pruebas para Terraform

#### Instalación
Excelente documentación para saber como instalar Terraform. [Terraform Infraestructura como Código](https://terraform-infraestructura.readthedocs.io/es/latest/instalacion/index.html)

#### Comandos básicos

- Para inicializar una carpeta.
```Shell
terraform init
```

- Una vez listo el código, para crear un plan de ejecución.
```Shell
terraform plan
```

- Para aplicar los cambios realizados.
```Shell
terraform apply
```
- Para aplicar los cambios realizados, sin pedir confirmación.
```Shell
terraform apply --auto-approve
```

- Para destruir la infraestructura creada.
```Shell
terraform destroy --auto-approve
```

#### Ejercicios en las carpetas
1. Para crear una instancia EC2 en AWS.
2. Se divide en 2:
	- Para crear una instancia EC2.
	- Para crear un autoscaling group y un launch configuration.
3. Para crear un backend remoto en un bucket S3.
4. Autoscaling group usando módulos.
5. Crear una VPC y un Launch configuration.
6. Crear un cluster ECS.
7. Crear un cluster con registro ECR usando variables de entorno.
8. Creación de un nuevo backend en un bucket S3
9. Creación de varios recursos:
	- Crear grupos de seguridad.
	- Crear instancia EC2.
	- Crear listener SSH en un balanceador de carga (red).
	- Crear reglas para un listener en un balanceador de carga (aplicación).
	- Crear grupos de destino.
10. Configure a Linux VM with infrastructure in Azure
	- Based on this tutorial from [Azure](https://docs.microsoft.com/en-us/azure/developer/terraform/create-linux-virtual-machine-with-infrastructure).

