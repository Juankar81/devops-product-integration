# Extensão Azure DevOps 

Este repositório contém uma extensão para o azure devops com uma task.

A estrutura deste template pode ser utilizada para criar extensões para o azure devops.

Esta task utiliza task-lib [azure-pipelines-task-lib](https://github.com/microsoft/azure-pipelines-task-lib).

Esta task utiliza o PowerShell3 Task Executer. Podem ser usados os seguinte [comandos](https://github.com/microsoft/azure-pipelines-task-lib/blob/master/powershell/Docs/Commands.md).

## Pré-requisitos

Esta extensão foi criada a partir do [tutorial](https://docs.microsoft.com/en-us/azure/devops/extend/develop/add-build-task?view=azure-devops#preparation-and-required-setup-for-this-tutorial) da microsoft. Aqui eles dizem todos os passos para criar uma extensão.

No powershell instalar executar: 
```powershell
Install-Module VstsTaskSdk -AllowClobber
```

## How-to

1. Atualizar a informação dentro do ficheiro [task.json](src/task/taskv1/task.json):
   * guid [gerador de guid](https://www.guidgen.com/)
   * id (não pode ter espaços)
   * name
   * friendlyname
   * description
   * instanceNameFormat (isto é opcional)
   * visibility (isto é opcional)
   * execution - caso tenha mais do que uma task a adicionar
   * adicionar groups e inputs necessários
1. Atualizar a informação dentro do ficheiro [vss-extension.json](src/vss-extension.json):
   * id (não pode ter espaços)
   * name
   * description
   * friendlyname
   * contributors.id (mesmo que o id)
   * files - caso tenha mais do que uma task ou ficheiros a adicionar
1. Caso necessário atualizar a versão [VstsTaskSdk](https://www.powershellgallery.com/packages/VstsTaskSdk):
   * Substituir o conteúdo da pasta [VstsTaskSdk](src/task/taskv1/ps_modules/VstsTaskSdk) com o novo conteudo
1. Atualizar o powershell [task.ps1](src/task/taskv1/task.ps1) com o script necessário.
1. Substituir os icons da extenção [aqui](src/images/logo.png) e [aqui](src/task/taskv1/icon.png). Ambos tem de ser 128x128.
1. Documentar a extensão no [README](README.md).

## Novas versões

Caso mais tarde seja necessário adicionar nova versão da task basta copiar a pasta `taskv1` pra `taskv2` exemplo [singleassembly](https://github.com/primaverabss/devops-extensibility-singleassembly)

Aqui é necessário alterar a variável `major` da pipeline para versionar a nova versão, a antiga versão fica congelada, caso haja necessidade de fazer alterações a versão deve ser incrementada automáticamente

Alterar o ficheiro [vss-extension.json](src/vss-extension.json) em contributions adicionar nova task.

Congelar versão anteriror [task.json](src/task/taskv1/task.json).

Caso seja necessário alterar versões anteriores é necessário incrementar manualmente a versão em [task.json](src/task/taskv1/task.json).

Nota.:

* Depois da primeira publicação da extensão, é necessário ir ao [marketplace](https://marketplace.visualstudio.com/manage/publishers/primaverabss) e fazer share com a organização, por exemplo `primaverabss`.

## Histórico

Foi fixada a pasta ps_module com a versão [0.11.0](https://www.powershellgallery.com/packages/VstsTaskSdk). Esta pasta tem de estar dentro da pasta task para funcionamento correto.

# Pipelines

O ficheiro [azure-pipelines.yml](.ci-cd/pipelines/azdevops/azure-pipelines.yml) já tem os passos da pipeline definida.
Aqui serão feitos os replaces necessários nos ficheiros [vss-extension.json](src/vss-extension.json) e [task.json](src/task/taskv1/task.json).

O ficheiro [devops-extensibility-template.json](.ci-cd/pipelines/azdevops/devops-extensibility-template.json) contém a definição da relase.
No Azure DevOps basta importar a definição, modificar o agent pool adicionar o artefacto da pipeline criada anteriormente.

# Extensões

Depois da release finalizada com sucesso é necessário partilhar a extensão com a organização primaverabss.

As extensões da podem ser consultadas [aqui](https://marketplace.visualstudio.com/manage/publishers/PRIMAVERABSS).

Depois de partilhada a extensão deve ser instalada nas extensões no [Azure DevOps](https://dev.azure.com/primaverabss/_settings/extensions?tab=shared)


