# Created by Works4me.info

#############--------------------------------------------------#
#############                                                  #  All the Global variables that you will
#############             +-+-+-+-+-+-+-+-+-+                  #  call in the rest of the code.
#############             |V|a|r|i|a|b|l|e|s|                  #
#############             +-+-+-+-+-+-+-+-+-+                  #  Sometime this might execute stuff, so
#############                                                  #  think of this as a setup section too.
#############--------------------------------------------------#  --------------------------------------

$global:Today = Get-Date
$global:AddDescription = $True

#VERSION OUTPUT DATA
$global:Version = "2.0"
$global:VersionDate = "1/2/2025"
    #----------------------2.0------------------------
    #  I removed all the erroneous code, and kept it
    #  just to the code for the Menu (as best I could)
    #-------------------------------------------------
    #  I also cleaned up the Option Functions to show 
    #  a little variety on how it can be used.
    #-------------------------------------------------

#############--------------------------------------------------#
#############                                                  #  The Functions that are repeatedly used  
#############          +-+-+-+-+-+-+-+-+-+-+-+-+-+-+           #  by rest of the code, think of these
#############          |C|o|r|e| |F|u|n|c|t|i|o|n|s|           #  as Functions used by Functions.
#############          +-+-+-+-+-+-+-+-+-+-+-+-+-+-+           #  --------------------------------------
#############                                                  #  
#############--------------------------------------------------#  


#--------------------------------------------------------------------------------------------------------------
#   Base Menu                     
#--------------------------------------------------------------------------------------------------------------
function Make-Menu {
    
    # You can add more, but this allow an initial
    # 6 options, a quit menu, and the option to 

    param (
        [string]$MenuTitle = $null,
        [string]$Option1 = $null,
        [string]$Function1 = $null,
        [string]$Option2 = $null,
        [string]$Function2 = $null,
        [string]$Option3 = $null,
        [string]$Function3 = $null,
        [string]$Option4 = $null,
        [string]$Function4 = $null,
        [string]$Option5 = $null,
        [string]$Function5 = $null,
        [string]$Option6 = $null,
        [string]$Function6 = $null,
        [Switch]$OptionQuit
    )


    # This prevents the Colour bleeds while in Powershell ISE.
    # You won't need this in a normal Powershell Console.
    #---------------------------------------------------------
    # Start-Sleep -Seconds 1

    Write-Host "   --------------------------------------------"
    Write-Host "     " $MenuTitle -ForegroundColor Cyan
    Write-Host "   --------------------------------------------"
    if($Option1 -ne ""){
        Write-Host "   1. " $Option1
    }
    if($Option2 -ne ""){
        Write-Host "   2. " $Option2
    }
    if($Option3 -ne ""){
        Write-Host "   3. " $Option3
    }
    if($Option4 -ne ""){
        Write-Host "   4. " $Option4
    }
    if($Option5 -ne ""){
        Write-Host "   5. " $Option5
    }
    if($Option6 -ne ""){
        Write-Host "   6. " $Option6
    }
    if($OptionQuit -eq $true){
        Write-Host "   Q.  Quit" -ForegroundColor Red
    }
    Write-Host " " 

    $choice01 = 0
    while ($choice01 -ne "Q") {
        $choice01 = Read-Host "    Enter your choice"

        # Take action based on user input
        switch ($choice01) {
            1 { 
                if($Option1 -ne ""){                       #--------------------------------------
                    cls                                    #  Note: Every choice will end the Menu
                    $test = & $Function1.ToString()        #  by setting $Choice01 to "Q".
                    $choice01="Q"                          #  This means wherever you go, you 
                }                                          #  need to Call this Function again.
              }                                            #--------------------------------------
            2 { 
                if($Option2 -ne ""){
                    cls                    
                    $test = & $Function2.ToString()
                    $choice01="Q"
                } 
              }
            3 { 
                if($Option3 -ne ""){
                    cls                    
                    $test = & $Function3.ToString()
                    $choice01="Q"
                } 
              }
            4 { 
                if($Option4 -ne ""){
                    cls                    
                    $test = & $Function4.ToString()
                    $choice01="Q"
                } 
              }
            5 { 
                if($Option5 -ne ""){
                    cls                    
                    $test = & $Function5.ToString()
                    $choice01="Q"
                } 
              }

            6 { 
                if($Option6 -ne ""){
                    cls                    
                    $test = & $Function6.ToString()
                    $choice01="Q"
                }
              }
            # The final conditions are for Quitting, and it changes a 
            # lower case "q" into a "Q", so that you use the default quit
            "q" { 
                $choice01="Q"
              }
            "Q" { Get-Quiting }
            default { Write-Host "Invalid option. Please try again." -foregroundcolor red; continue }
        }
    }
}

#--------------------------------------------------------------------------------------------------------------
####    Pause Funtion - For the "Press Any Key"  action 
#--------------------------------------------------------------------------------------------------------------
Function Pause {
    
    # Check if running in PowerShell ISE
    If ($psISE) {
        #Use the ENTER Option
        Write-Host " "
        read-host “  Press ENTER to continue...”
    }Else {
        #Use the ANYKEY Toption
        Write-Host " "
        Write-Host "  Press any key to continue..."
        $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
}

#--------------------------------------------------------------------------------------------------------------
####    Option 1 
#--------------------------------------------------------------------------------------------------------------
Function Do-Option01{
    
    Write-Host " "
    Write-Host "  You're logged in as: $env:USERNAME" -ForegroundColor Green
}

#--------------------------------------------------------------------------------------------------------------
####    Option 2
#--------------------------------------------------------------------------------------------------------------
Function Do-Option02{
    
    Write-Host " "
    Write-Host "  Today is" $global:Today -ForegroundColor Green
}
#--------------------------------------------------------------------------------------------------------------


#############--------------------------------------------------#
#############                                                  #  The Various unique Functions 
#############            +-+-+-+-+-+-+-+-+-+-+-+-+             #  that do the fancy pants part
#############            |D|o| |F|u|n|c|t|i|o|n|s|             #  and navigation of your code.
#############            +-+-+-+-+-+-+-+-+-+-+-+-+             #  ----------------------------
#############                                                  #  
#############--------------------------------------------------#  


#--------------------------------------------------------------------------------------------------------------
####    Sub Menu
#--------------------------------------------------------------------------------------------------------------
Function Do-SubMenu{

    # This checks if you should add the Description or not
    # which isn't important to the scipt, but just demonstrates 
    # what you can do, to control the GUI
    if ($global:AddDescription -eq $False){
            # It will reset it to always show,
            # so you need to decide to hide it
            $global:AddDescription = $True
    }Else{
        Write-Host "  "
        Write-Host "     Some additional Section or Function"  -ForegroundColor Cyan
        Write-Host "   -------------------------------------------------"
        Write-Host "  "
        Write-Host "   This would be where you add something special or"
        Write-Host "   maybe you run / call a bunch of other functions,"
        Write-Host "   but thats really up to you."
        Write-Host "  "
        Write-Host "  "
        Write-Host "   The real key is to watch where you use the " -NoNewline
        Write-Host "cls" -ForegroundColor Green
        Write-Host "   code, so that the Menu sits under the data you "
        Write-Host "   have displayed, like so:"
    }
    Write-Host "  "
    Make-Menu -MenuTitle "Sub Structure" `
        -Option1 "Display User" -Function1 "Do-Sub01" `
        -Option2 "Display Day" -Function2 "Do-Sub02" `
        -Option3 "Reload the Description" -Function3 "Do-Sub03" `
        -Option4 "Main Menu " -Function4 "Do-Welcome"
}

#--------------------------------------------------------------------------------------------------------------
####    Main Option 1 
#--------------------------------------------------------------------------------------------------------------
Function Do-Main01{
    
    Do-Option01
    Write-Host "  This will reuse the Do-Welcome function"
    Pause
    Do-Welcome
}

#--------------------------------------------------------------------------------------------------------------
####    Main Option 2 
#--------------------------------------------------------------------------------------------------------------
Function Do-Main02{
    
    Write-Host " "
    Write-Host "  Today is" $global:Today -ForegroundColor Green
    Write-Host "  This will REBUILD the Do-Welcome Menu"
    Pause
    cls
    Make-Menu -OptionQuit -MenuTitle "WELCOME Menu" `
        -Option1 "Display User" -Function1 "Do-Main01" `
        -Option2 "Display Day" -Function2 "Do-Main02" `
        -Option3 "Other Options" -Function3 "Do-SubMenu"
}

#--------------------------------------------------------------------------------------------------------------
####    Sub Option 1 
#--------------------------------------------------------------------------------------------------------------
Function Do-Sub01{
    
    
    Write-Host " "
    Write-Host "  You're logged in as: $env:USERNAME" -ForegroundColor Green
    Write-Host "  This will REUSE the Do-SubMenu Function"
    #  I'm setting that this doesn't need the 
    #  added desctiption
    $global:AddDescription = $False
    Do-SubMenu
}

#--------------------------------------------------------------------------------------------------------------
####    Sub Option 2 
#--------------------------------------------------------------------------------------------------------------
Function Do-Sub02{
    
    Do-Option02
    Write-Host "  This will REBUILD the Do-SubMenu Menu"
    Write-Host " "
    Make-Menu -MenuTitle "Sub Structure" `
        -Option1 "Display User" -Function1 "Do-Sub01" `
        -Option2 "Display Day" -Function2 "Do-Sub02" `
        -Option3 "Reload the Description" -Function3 "Do-Sub03" `
        -Option4 "Main Menu " -Function4 "Do-Welcome"
}

#--------------------------------------------------------------------------------------------------------------
####    Sub Option 3 
#--------------------------------------------------------------------------------------------------------------
Function Do-Sub03{
    $global:AddDescription = $True
    cls
    Do-SubMenu
}

#--------------------------------------------------------------------------------------------------------------
####    Farewell Message
#--------------------------------------------------------------------------------------------------------------
Function Get-Quiting {
    
    cls
    Write-Host " "
    Write-Host "   -----------------------"
    Write-Host "    Thanks for popping in"-ForegroundColor Cyan
    Write-Host "   -----------------------"
    Write-Host " "
}

#--------------------------------------------------------------------------------------------------------------
####    Welcome Menu calling
#--------------------------------------------------------------------------------------------------------------
function Do-Welcome {
    
    cls
    Make-Menu -OptionQuit -MenuTitle "WELCOME Menu" `
    -Option1 "Display User" -Function1 "Do-Main01" `
    -Option2 "Display Day" -Function2 "Do-Main02" `
    -Option3 "Other Options" -Function3 "Do-SubMenu"
}


#############--------------------------------------------------#
#############                                                  #  Simply the section in which
#############             +-+-+-+-+-+-+-+-+-+-+-+              #  you call all the functions &
#############             |R|u|n| |S|e|c|t|i|o|n|              #  excute the core part of the
#############             +-+-+-+-+-+-+-+-+-+-+-+              #  code.
#############                                                  #  ----------------------------
#############--------------------------------------------------# 


#### Load the initial Menu
Do-Welcome


#--------------------------------------------------------------------------------------------------------------
