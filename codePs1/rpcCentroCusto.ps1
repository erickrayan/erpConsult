. .\rpcCentroCustoForm.ps1 #carrega os comandos para a interface gr�fica

$data = @(
[pscustomobject]@{NomeCod='CCusto';TamanhoCod=9;TipoCod='Receita';PrefixCod='1'}
[pscustomobject]@{NomeCod='CCusto';TamanhoCod=9;TipoCod='Despesa';PrefixCod='2'}
[pscustomobject]@{NomeCod='CentroCusto';TamanhoCod=7}
)


$botaoOk.Add_click({ #essa parte � executada ao clicar no bot�o ok
    if ("" -eq $textboxDescrConta.Text -or $textboxCodConta.Text.Length -ne $listboxTipoConta.SelectedItem.TamanhoCod){
        [System.Windows.MessageBox]::Show('Preencha todos os campos com valores v�lidos.', 'Erro')
    }
    else{
        $cont=0
        foreach ($linha in (Get-Content -path ($pathdata +"\tbSgCCusto.txt"))){ #verifica se j� existe algum c�digo de conta igual
            if(($linha -split " \| ")[1] -eq $textboxCodConta.text){
                $cont++
                break
            }
        }
        if($cont -ne 0){
            [System.Windows.MessageBox]::Show('Centro de custo j� existente.')
        }
        else{ #se estiver tudo correto

            #preenche vari�veis para adicionar no arquivo
            $sgconta=(Get-Content -path ($pathdata +"\ixSgCCusto.txt"))
            $cdConta=$textboxCodConta.Text
            $dsConta=$textboxDescrConta.Text
            
            if ($radiobuttonContaAtiva.Checked){ #se o status for ativo
                [string]$stConta=01
            }
            else { #se o status for inativo
                [string]$stConta=02
            }

            Add-Content -Value "$sgconta | $cdConta | $dsConta | $stConta" -Path ($pathdata +"\tbSgCCusto.txt")

            $ultimo=(Get-Content -path ($pathdata + "\ixSgCCusto.txt")) #vari�vel recebe conte�do do texto
            [int]$ultimo=$ultimo #vari�vel � convertida para int
            $ultimo++ #e � incrementada
            [string]$ultimo=([string]$ultimo).PadLeft(4,'0') #vari�vel volta a ser string padronizada com zeros � esquerda
            Clear-Content -Path ($pathdata +"\ixSgCCusto.txt")
            Add-Content -Value $ultimo -Path ($pathdata +"\ixSgCCusto.txt")
            $labelSgConta.Text = "sgCCusto: " + $ultimo + ":"

            
            [System.Windows.MessageBox]::Show('Centro de custoadicionada.')
        }
    }
})

$textboxCodConta.Add_TextChanged({ #evento acionado toda vez que a caixa de texto � modificada

    $this.Text = $this.Text -replace '\D' #substitui qualquer item n�o decimal por vazio
    $this.Select($this.Text.Length, 0); #coloca o cursor de volta no final do texto
    
    
})



$listboxTipoConta.add_SelectedIndexChanged({ #ativado ao mudar a sele��o da listbox

    #ativa os elementos de entrada
    $labelSgConta.Enabled =        $true
    $labelCodConta.Enabled =       $true
    $labelDescrConta.Enabled =     $true
    $textboxCodConta.Enabled =     $true
    $textboxDescrConta.Enabled =   $true
    $groupboxStatusConta.Enabled = $true

    $textboxCodConta.MaxLength = $listboxTipoConta.SelectedItem.TamanhoCod #define a capacidade m�xima de caracteres da caixa de texto
     
    if($textboxCodConta.Text.Length -eq 0){ #imossibilitar caixa de texto vazia
        $textboxCodConta.Text = 1
    } 
    else{
        $textboxCodConta.Text=$textboxCodConta.Text.Remove(0,1).Insert(0, $listboxTipoConta.SelectedItem.PrefixCod)
    }
    

    
    $digitos = $listboxTipoConta.SelectedItem.TamanhoCod
    $labelCodConta.Text = "Digite o c�digo do centro de custo com $digitos d�gitos :"
})



foreach ($item in $data) {
    if($item.NomeCod -eq 'Conta' ){
        [void]$listboxTipoConta.Items.Add($item)
    }
}




$listboxTipoConta.DisplayMember = "TipoCod"


$labelSgCcusto.Text = "sgCusto: " + (Get-Content -path ($pathdata + "\ixSgCCusto.txt")) + ":" #preenche o label
[void]$formCcusto.ShowDialog()
