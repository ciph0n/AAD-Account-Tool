Add-Type -Assembly System.Windows.Forms
Add-Type -Assembly PresentationFramework

# This code was written for internal use.

$FormTitle = "[1.8.5] ciph0n's AAD Account Tool"
$AllDebug = $false
[xml]$Form = @"
<Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:PasswordResetTool"
        Title="$FormTitle" Height="350" Width="725" HorizontalContentAlignment="Stretch" VerticalContentAlignment="Stretch" Background="#FF21222C" ResizeMode="CanMinimize">
    <Window.Resources>
        <Style x:Key="Default" TargetType="Button">
            <Setter Property="OverridesDefaultStyle" Value="True"/>
            <Setter Property="Margin" Value="5"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Name="border" BorderBrush="#FF191921" Background="{TemplateBinding Background}">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="border" Property="Background" Value="#1A1C23" />
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
        <Style x:Key="CatButtonStyle" TargetType="Button">
            <Setter Property="OverridesDefaultStyle" Value="True"/>
            <Setter Property="Margin" Value="5"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Name="border" Background="{TemplateBinding Background}">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center" />
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="border" Property="Background" Value="#1A1C23" />
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
    </Window.Resources>
    <Grid Margin="0" MaxHeight="350" MaxWidth="725">
        <TextBox Name="tbInput" HorizontalAlignment="Left" Height="32" Margin="134,10,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="264" ToolTip="Insert UserID" Background="#FF282A36" BorderBrush="#FF191921" Foreground="#FFE3E7EA" TabIndex="0" FontSize="15" TextOptions.TextHintingMode="Fixed" VerticalContentAlignment="Center"/>
        <Button Name="bSubmit" Style="{StaticResource Default}" Content="Submit" HorizontalAlignment="Left" Margin="403,10,0,0" VerticalAlignment="Top" Width="75" Height="32" BorderBrush="#FF191921" Background="#FF282A36" Foreground="#FFE3E7EA" TabIndex="1" FontSize="15" Cursor="Hand"/>
        <Button Name="bClear" Style="{StaticResource Default}" Content="Clear" HorizontalAlignment="Left" Margin="483,10,0,0" VerticalAlignment="Top" Width="75" Height="32" BorderBrush="#FF191921" Background="#FF282A36" Foreground="#FFE3E7EA" TabIndex="2" FontSize="15" Cursor="Hand"/>
        <TextBox Name="tbOutput" HorizontalAlignment="Left" Height="175" Margin="134,50,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="424" BorderBrush="#FF191921" Background="#FF282A36" Foreground="#FFE3E7EA" IsReadOnly="True" FontSize="15"/>
        <StackPanel HorizontalAlignment="Left" Height="469" VerticalAlignment="Top" Width="118" Background="#FF282A36"/>
        <Button Name="cbAccounts" Style="{StaticResource CatButtonStyle}" Content="Accounts" HorizontalAlignment="Left" Margin="0,50,0,0" VerticalAlignment="Top" Width="118" Height="38" FontSize="15" Foreground="#FFE3E7EA" Background="#FF282A36" BorderBrush="{x:Null}" Cursor="Hand"/>
        <Button Name="cbDevices" Visibility="Hidden" Style="{StaticResource CatButtonStyle}" Content="Devices" HorizontalAlignment="Left" Margin="0,95,0,0" VerticalAlignment="Top" Width="118" Height="38" FontSize="15" Foreground="#FFE3E7EA" Background="#FF282A36" BorderBrush="{x:Null}" Cursor="Hand"/>
        <Button Name="bUnlock" Visibility="Hidden" Style="{StaticResource Default}" Content="Enable Account" HorizontalAlignment="Left" Margin="563,50,0,0" VerticalAlignment="Top" Width="137" Height="32" BorderBrush="#FF191921" Background="#FF282A36" Foreground="#FFE3E7EA" TabIndex="2" FontSize="15" Cursor="Hand"/>
        <Button Name="bResetPassword" Visibility="Hidden" Style="{StaticResource Default}" Content="Reset Password" HorizontalAlignment="Left" Margin="563,95,0,0" VerticalAlignment="Top" Width="137" Height="32" BorderBrush="#FF191921" Background="#FF282A36" Foreground="#FFE3E7EA" TabIndex="2" FontSize="15" Cursor="Hand"/>
        <Button Name="bGroupMembership" Visibility="Hidden" Style="{StaticResource Default}" Content="Group Membership" HorizontalAlignment="Left" Margin="563,140,0,0" VerticalAlignment="Top" Width="137" Height="32" BorderBrush="#FF191921" Background="#FF282A36" Foreground="#FFE3E7EA" TabIndex="2" FontSize="15" Cursor="Hand"/>
        <Label Name="tbGOutput" Content="" HorizontalAlignment="Left" Height="32" Margin="134,234,0,0" VerticalAlignment="Top" Width="424" BorderBrush="#FF191921" Background="#FF282A36" Foreground="#FFE3E7EA" FontSize="15"/>
    </Grid>
</Window>
"@

[xml]$PasswordReset = @"
<Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:PasswordResetTool"
        Title="$FormTitle" Height="175" Width="285" HorizontalContentAlignment="Stretch" VerticalContentAlignment="Stretch" Background="#FF21222C" ResizeMode="CanMinimize">
    <Window.Resources>
        <Style x:Key="Default" TargetType="Button">
            <Setter Property="OverridesDefaultStyle" Value="True"/>
            <Setter Property="Margin" Value="5"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Name="border" BorderBrush="#FF191921" Background="{TemplateBinding Background}">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="border" Property="Background" Value="#1A1C23" />
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
    </Window.Resources>
    <Grid Margin="0,0,-20,-15">
        <TextBox Name="tbPR_Input" HorizontalAlignment="Left" Height="32" Margin="10,46,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="253" ToolTip="Insert UserID" Background="#FF282A36" BorderBrush="#FF191921" Foreground="#FFE3E7EA" TabIndex="0" FontSize="15" TextOptions.TextHintingMode="Fixed" VerticalContentAlignment="Center"/>
        <Button Name="bPR_Submit" Style="{StaticResource Default}" Content="Submit" HorizontalAlignment="Left" Margin="188,83,0,18" VerticalAlignment="Center" Width="75" Height="32" BorderBrush="#FF191921" Background="#FF282A36" Foreground="#FFE3E7EA" TabIndex="1" FontSize="15" Cursor="Hand"/>
        <Button Name="bPR_Clear" Style="{StaticResource Default}" Content="Clear" HorizontalAlignment="Left" Margin="100,83,0,18" VerticalAlignment="Center" Width="75" Height="32" BorderBrush="#FF191921" Background="#FF282A36" Foreground="#FFE3E7EA" TabIndex="2" FontSize="15" Cursor="Hand"/>
        <Button Name="bPR_Cancel" Style="{StaticResource Default}" Content="Cancel" HorizontalAlignment="Left" Margin="10,83,0,18" VerticalAlignment="Center" Width="75" Height="32" BorderBrush="#FF191921" Background="#FF282A36" Foreground="#FFE3E7EA" TabIndex="2" FontSize="15" Cursor="Hand"/>
        <Label Name="lPR_Title" Content="Password Reset" HorizontalAlignment="Center" Margin="10,10,149,0" VerticalAlignment="Top" Foreground="#FFE3E7EA" FontSize="16" Width="132"/>
    </Grid>
</Window>
"@

[xml]$GroupMemberships = @"
<Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:PasswordResetTool"
        Title="$FormTitle" Height="400" Width="290" HorizontalContentAlignment="Stretch" VerticalContentAlignment="Stretch" Background="#FF21222C" ResizeMode="CanMinimize">
    <Grid>
        <TextBox Name="tbGM_Output" HorizontalAlignment="Left" Height="305" Width="254" Margin="12,46,0,0" TextWrapping="Wrap" VerticalAlignment="Top" IsReadOnly="True" Background="#FF282A36" BorderBrush="#FF191921" Foreground="#FFE3E7EA" TabIndex="0" FontSize="15" VerticalContentAlignment="Center"/>
        <Label Name="lGM_Title" Content="Group Membership(s):" HorizontalAlignment="Center" Margin="10,10,10,0" VerticalAlignment="Top" Foreground="#FFE3E7EA" FontSize="16" Width="254"/>
    </Grid>
</Window>
"@

# Elevate with UAC to install required modules
if ((Get-InstalledModule "AzureAD" | Select-Object -ExpandProperty Name) -ne "AzureAD") {
    if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
        if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
            try {
                Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList {Install-Module "AzureAD" -Force} -Wait
                Exit
            } catch {
                throw
            }
        }
    }
}

try {
    Import-Module "AzureAD"
    try {
        # [Automatic] Login using UPN credentials
        $UPN = whoami /UPN
        Connect-AzureAD -AccountId $UPN | Out-Null
    } catch {
        # [Manual] Login with user credentials
        Connect-AzureAD | Out-Null
    }
} catch {
    throw
}

# Create the Main form and assign the variables
$FMain = [Windows.Markup.XamlReader]::Load((New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList $Form))
$Form.SelectNodes("//*[@Name]") | ForEach-Object {
    try {
        Set-Variable -Name "var_$($_.Name)" -Value $FMain.FindName($_.Name) -ErrorAction Stop
    } catch {
        throw
        Exit
    }
}

# When function is enabled you can use this to echo all output
function AllDebug {
    param ( [string]$errorLoc, [string]$errorMSG, [string]$errorColor )
    if ($AllDebug -eq $true) {
        Write-Host "[$errorLoc] $errorMSG" -ForegroundColor $errorColor
    }
}

# This is used for changing visibility on buttons when applicable
function HideControls {
    param ( [bool]$hControl )
    if ($hControl -eq $true) {
        $var_bGroupMembership.Visibility = "Hidden"
        $var_bResetPassword.Visibility = "Hidden"
        $var_bUnlock.Visibility = "Hidden"
    } else {
        $var_bGroupMembership.Visibility = "Visible"
        $var_bResetPassword.Visibility = "Visible"
        $var_bUnlock.Visibility = "Visible"
    }
}

# User for checking email format
function RevealEmail {
    param ( [string]$Email )
    $Email = $Email -Replace '\s',''
    if ($Email -notlike "*@REDACTED.REDACTED") {
        $Email = "$Email@REDACTED.REDACTED"
    }
    return $Email
}

# Forcibly empty UI data if a user is invalid
function PanicClear {
    param ( [string]$Output )
    HideControls $true
    $var_tbInput.Text = ""
    $var_tbOutput.Text = ""
    $var_tbGOutput.Content = $Output
}

# Main : Submit Button
$var_bSubmit.Add_Click({
    if ($var_tbInput.Text.length -eq 0) {
        PanicClear "No userID was entered... Please try again.";
    } else {
        $Email = RevealEmail $var_tbInput.Text
        Try {
            $uDB = @(Get-AzureADUser -Filter "startswith(Mail,'$Email')" -ErrorAction Stop) 
            if ($uDB.length -eq 0) {
                throw "0DataFound"
            }
            # Assign data array to variables
            $EPuDB = $uDB | Select-Object -Expand ExtensionProperty;
            $uSupervisor = Get-AzureADUserManager -ObjectId $Email | Select-Object -Expand DisplayName
            # Output data to text box
            $var_tbOutput.Text = "Display Name: " + $uDB.DisplayName + " (" + $EPuDB.employeeId + ")`r`nLocation: " + $uDB.PhysicalDeliveryOfficeName + "`r`nJob Title: " + $uDB.JobTitle + "`r`nSupervisor: " + $uSupervisor + "`r`n`r`nAccount Enabled: " + $uDB.AccountEnabled + "`r`nAccount Creation: " + $EPuDB.createdDateTime + "`r`nPassword Last Changed: " + $uDB.RefreshTokensValidFromDateTime
            HideControls $false
        } Catch {
            AllDebug "var_bSubmit.Add_Click" $_.Exception.Message "Red"
            if ($_.Exception.Message -like "User Not Found*") {
                $var_tbOutput.Text = "`"$Email`" could not be found! Please try again."
                HideControls $true
            } elseif ($_.Exception.Message -eq "0DataFound") {
                $var_tbOutput.Text = "`"$Email`" could not be found! Please try again."
                HideControls $true
            }
        }
    }
})

# Clear all fields
$var_bClear.Add_Click({
    PanicClear ""
})

# Account : Enable/Unlock Account 
$var_bUnlock.Add_Click({
    if ($var_tbInput.Text.length -eq 0) {
        PanicClear "No userID was entered... Please try again.";
    } else {
        $Email = RevealEmail $var_tbInput.Text
        Try {
            $uDB = @(Get-AzureADUser -Filter "startswith(Mail,'$Email')" -ErrorAction Stop) 
            if ($uDB.length -eq 0) {
                throw "0DataFound"
            }
            # Enable Account
            Set-AzureADUser -ObjectID $uDB.ObjectID -AccountEnabled $true
            # Update output text box
            $var_tbGOutput.Content = $uDB.DisplayName + "'s account has been unlocked."
        } Catch {
            AllDebug "var_bSubmit.Add_Click" $_.Exception.Message "Red"
            if ($_.Exception.Message -like "User Not Found*") {
                $var_tbOutput.Text = "`"$Email`" could not be found! Please try again."
                HideControls $true
            } elseif ($_.Exception.Message -eq "0DataFound") {
                $var_tbOutput.Text = "`"$Email`" could not be found! Please try again."
                HideControls $true
            }
        }
    }
})

# Account : Password Reset Category
# Create the Password Reset form and assign the variables
$var_bResetPassword.Add_Click({
    $FPassReset = [Windows.Markup.XamlReader]::Load((New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList $PasswordReset))
    $PasswordReset.SelectNodes("//*[@Name]") | ForEach-Object {
        try {
            Set-Variable -Name "var_$($_.Name)" -Value $FPassReset.FindName($_.Name) -ErrorAction Stop
        } catch {
            throw
            Exit
        }
    }

    $Email = RevealEmail $var_tbInput.Text
    $uDB = @(Get-AzureADUser -Filter "startswith(Mail,'$Email')" -ErrorAction Stop)
    $var_bPR_Submit.Add_Click({
        Try {
            if ($uDB.length -eq 0) {
                throw "0DataFound"
            }
            # Regex is used for password requirements. This includes the following:
            # At minimum: 1 capital [A-Z], 1 lowercase [a-z], 1 symbol [@$!%()^*#?&], 9 characters long
            if ($var_tbPR_Input.Text -match '^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%()^*#?&])[A-Za-z\d@$!%()^*#?&]{9,}$') {
                $var_tbPR_Input.BorderBrush = "#77DD77"
                # Change UPN to managed domain
                Set-AzureADUser -ObjectId $uDB.ObjectID -UserPrincipalName $uDB.MailNickName@REDACTED.onmicrosoft.com

                # Update the password
                Set-AzureADUserPassword -ObjectId $uDB.ObjectID -Password (ConvertTo-SecureString -AsPlainText $var_tbPR_Input.Text -Force)

                # Change UPN back to the federated domain
                Set-AzureADUser -ObjectId $uDB.ObjectID -UserPrincipalName $uDB.MailNickName@REDACTED.REDACTED

                # Update output text box
                $var_tbGOutput.Content = $uDB.DisplayName + "'s password has been reset."
                $FPassReset.Close()
            } else {
                $var_tbPR_Input.BorderBrush = "#FF6961"
            }
        } Catch {
            AllDebug "var_bPR_Submit.Add_Click" $_.Exception.Message "Red"
            if ($_.Exception.Message -like "User Not Found*") {
                $var_tbOutput.Text = "`"$Email`" could not be found! Please try again."
            } elseif ($_.Exception.Message -eq "0DataFound") {
                $var_tbOutput.Text = "`"$Email`" could not be found! Please try again."
                HideControls $true
            }
        }
    })

    # Account : Password Reset Clear Button
    $var_bPR_Clear.Add_Click({
        $var_tbPR_Input.Text = ""
    })

    if ($uDB.length -eq 0) {
        PanicClear "No userID was entered... Please try again.";
    } else {
        $FPassReset.ShowDialog() | Out-Null
    }
})

# Group Memberships Category
# Create the Group Memberships form and assign the variables
$var_bGroupMembership.Add_Click({
    $FGroupMemberships = [Windows.Markup.XamlReader]::Load((New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList $GroupMemberships))
    $GroupMemberships.SelectNodes("//*[@Name]") | ForEach-Object {
        try {
            Set-Variable -Name "var_$($_.Name)" -Value $FGroupMemberships.FindName($_.Name) -ErrorAction Stop
        } catch {
            throw
            Exit
        }
    }

    $Email = RevealEmail $var_tbInput.Text
    $uDB = @(Get-AzureADUser -Filter "startswith(Mail,'$Email')" -ErrorAction Stop)

    # Display groups in form output box
    Try {
        $uGroups = Get-AzureADUserMembership -ObjectId $Email | Select-Object -Expand DisplayName
        ForEach ($data in $uGroups) {
            $var_tbGM_Output.Text += "$data`r`n"
        }
    } Catch {
        AllDebug "var_bGroupMembership.Add_Click" $_.Exception.Message "Red"
        if ($_.Exception.Message.Contains("Code: Request_ResourceNotFound")) {
            $var_tbGM_Output.Text = "`"$Email`" could not be found! Please try again."
        }
    }

    if ($uDB.length -eq 0) {
        PanicClear "No userID was entered... Please try again.";
    } else {
        $FGroupMemberships.ShowDialog() | Out-Null
    }
})

$FMain.ShowDialog() | Out-Null