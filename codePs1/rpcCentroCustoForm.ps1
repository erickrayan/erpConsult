Add-Type -AssemblyName System.Windows.forms
Add-Type -Assemblyname System.Drawing
Add-Type -AssemblyName PresentationFramework #para janelas de erro ou sucesso

#Janela principal
$formCcusto = New-Object System.Windows.Forms.Form
$formCcusto.text = "Centro de custo"
$formCcusto.size = New-Object System.Drawing.Size(350,480)
$formCcusto.StartPosition = "CenterScreen"

#Label código da conta
$labelcodCcusto = New-Object System.Windows.Forms.Label
$labelcodCcusto.Text = "Digite o código do centro de custo:"
$labelcodCcusto.Location =  New-Object System.Drawing.Size(20,85)
$labelcodCcusto.AutoSize = $true
#$labelcodCcusto.Enabled = $false
$formCcusto.Controls.Add($labelcodCcusto)

#Label com o código sgConta gerado automaticamente
$labelSgCcusto = New-Object System.Windows.Forms.Label
$labelSgCcusto.Location =  New-Object System.Drawing.Size(23,122)
$labelSgCcusto.AutoSize = $true
#$labelSgCcusto.Enabled = $false
$formCcusto.Controls.Add($labelSgCcusto)

#Label Descrição conta
$labelDescrConta = New-Object System.Windows.Forms.Label
$labelDescrConta.Text = "Digite descrição do centro de custo:"
$labelDescrConta.Location =  New-Object System.Drawing.Size(20,175) #antes 95y
$labelDescrConta.AutoSize = $true
#$labelDescrConta.Enabled = $false
$formCcusto.Controls.Add($labelDescrConta)

#Caixa de texto código da conta
$textboxCodConta = New-Object System.Windows.Forms.TextBox
#$textboxCodConta.Minimum = 10000000
#$textboxCodConta.Maximum = 29999999
#$textboxCodConta.Value   = 10000001
#$textboxCodConta.Text = 1
$textboxCodConta.Location = New-Object System.Drawing.Size(103,120)
$textboxCodConta.Size = New-Object System.Drawing.Size(205,20)
#$textboxCodConta.Enabled = $false
$formCcusto.Controls.Add($textboxCodConta)

#Caixa de texto descrição de conta contábil
$textboxDescrConta = New-Object System.Windows.Forms.TextBox
$textboxDescrConta.Location = New-Object System.Drawing.Size(22,210) #antes 130y
$textboxDescrConta.Size = New-Object System.Drawing.Size(286,20)
#$textboxDescrConta.Enabled = $false
$formCcusto.Controls.Add($textboxDescrConta)

#botão cancelar 
$botaoCancelar = New-Object System.Windows.Forms.Button 
$botaoCancelar.Location = New-Object System.Drawing.Size(130,390)
$botaoCancelar.Size = New-Object System.Drawing.Size(100,20)
$botaoCancelar.Text = "Fechar"
$botaoCancelar.Add_Click({$formCcusto.Tag = $formCcusto.close()}) 
$formCcusto.Controls.Add($botaoCancelar)

#botão ok
$botaoOk = New-Object System.Windows.Forms.Button #botão ok
$botaoOk.Location = New-Object System.Drawing.Size(20,390)
$botaoOk.Size = New-Object System.Drawing.Size(100,20)
$botaoOk.Text = "Ok"
$formCcusto.Controls.Add($botaoOk)



#Groupbox para botões radiais status da conta
$groupboxStatusConta = New-Object System.Windows.Forms.GroupBox 
$groupboxStatusConta.Location = New-Object System.Drawing.Size(20,245)
$groupboxStatusConta.Size = New-Object System.Drawing.Size(286, 50)
$groupboxStatusConta.Text = "Status do centro de custo"
#$groupboxStatusConta.Enabled = $false
#$formCcusto.Controls.Add($groupboxStatusConta)

$radiobuttonContaAtiva = New-Object System.Windows.Forms.RadioButton
$radiobuttonContaAtiva.Location = '11,20'
$radiobuttonContaAtiva.size = '99,20'
$radiobuttonContaAtiva.Checked = $true 
$radiobuttonContaAtiva.Text = "Ativo"

$radiobuttonContaInativa = New-Object System.Windows.Forms.RadioButton
$radiobuttonContaInativa.Location = '110,20'
$radiobuttonContaInativa.size = '80,20'
$radiobuttonContaInativa.Checked = $false
$radiobuttonContaInativa.Text = "Inativo"
$groupboxStatusConta.Controls.AddRange(@($radiobuttonContaAtiva,$radiobuttonContaInativa))

#Label Tipo Conta
$labelTipoConta = New-Object System.Windows.Forms.Label
$labelTipoConta.Text = "Digite o Tipo do centro de custo:"
$labelTipoConta.Location =  New-Object System.Drawing.Size(20,15)
$labelTipoConta.AutoSize = $true
#$formCcusto.Controls.Add($labelTipoConta)

#combobox Tipo de Conta
$listboxTipoConta = New-Object System.Windows.Forms.ComboBox
$listboxTipoConta.Location = New-Object System.Drawing.Size(20,42)
$listboxTipoConta.Size = New-Object System.Drawing.Size(260,20)
$listboxTipoConta.Height = 80
$listboxTipoConta.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
#$formCcusto.Controls.Add($listboxTipoConta)
