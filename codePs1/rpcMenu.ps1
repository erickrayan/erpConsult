$nomePath = (split-path (Get-Item $PSCommandPath).Fullname)
Set-Location $nomePath
$pathData = $nomePath.Substring(0, $nomePath.lastIndexOf('\')) + "\Data"

. .\rpcMenuForm.ps1 #carrega os comandos para a interface grafica

$inserirCContabeis.Add_click({
    #[void]$formContabil.ShowDialog()
    . .\rpcContaContabil.ps1
})

$inserirCCusto.Add_click({
    #[void]$formCCusto.ShowDialog()
    . .\rpcCentroCusto.ps1
})

[void]$menu.ShowDialog()