# For any further Help Contact Orbit Turner @ orbitturner.com
Write-Host("<<------------------------------------------------------------>>");
Write-Host(" _____ _____ _____ _____    __    _____ _____ ____  _____ _____ ");
Write-Host("|   __|   __|_   _|  _  |  |  |  |     |  _  |    \|   __| __  |");
Write-Host("|__   |   __| | | |   __|  |  |__|  |  |     |  |  |   __|    -|");
Write-Host("|_____|__|    |_| |__|     |_____|_____|__|__|____/|_____|__|__|");
Write-Host("                                                                ");
Write-Host("<<------------------------------------------------------------->>");

$RemoteServerWorkDir = "Test2";
$LocalFileRepository = $PSScriptRoot+"\CONTAINER";
$LogFileName = "ScriptProcess_log";

function Logger {

    param (
        $msg
    )
    Write-Host("")
    Write-Output ("[$(Get-Date)] ~~> $msg")
    $logline = "$(Get-Date), $msg"
    Add-content ".\$LogFileName.txt" -value $logline
}

function ErrorLogger {

    param (
        $msg
    )
    Write-Host("")
    Write-Output ("[$(Get-Date)] | [!XX ERROR XX!] $msg [!XX ERROR XX!]")
    $logline = "$(Get-Date), $msg"
    Add-content ".\$LogFileName.txt" -value $logline
}

function UploadFile {
    param (
        $campainName,
        $FolderDate,
        $uploadFileName
    )
    
    # Upload files
    $transferOptions = New-Object WinSCP.TransferOptions
    $transferOptions.TransferMode = [WinSCP.TransferMode]::Binary

    # https://winscp.net/eng/docs/library_session_putfiles
    $transferResult =
        $session.PutFiles("$LocalFileRepository\$uploadFileName", "/$RemoteServerWorkDir/$campainName/$FolderDate/", $True, $transferOptions)

    # Throw on any error
    $transferResult.Check()

    # Print results
    foreach ($transfer in $transferResult.Transfers)
    {
        Logger("UPLOAD OF $($transfer.FileName) SUCCEEDED")
    }
}

Write-Host (">>>>> TRYING TO CONNECT TO REMOTE SFTP SERVER <<<<<")
try
{
    # Charger l'ensemble .NET de WinSCP
    Add-Type -Path "WinSCPnet.dll"
    
    
    # USING WINSCP API. @see: https://winscp.net/eng/docs/scripting#generating_script
    # Configurer les options de session
    $sessionOptions = New-Object WinSCP.SessionOptions -Property @{
        Protocol = [WinSCP.Protocol]::Ftp
        HostName = "XXX.XXX.XXX.XXX"
        UserName = "USERNAME"
        Password = "*********"
        FtpSecure = [WinSCP.FtpSecure]::Implicit
        TlsHostCertificateFingerprint = "GET IT FROM WINSCP GENERATE SCRIPT PANEL"
    }

    $session = New-Object WinSCP.Session
 
    try
    {
        # Connect
        $session.Open($sessionOptions);

        Logger("CONNECTION SUCCESSFULL")

        $reportingFileName = $LocalFileRepository;
        $latest = (Get-ChildItem $reportingFileName -Attributes !Directory | Sort-Object -Descending -Property LastWriteTime | select -First 1)
        $latest_filename = $latest.Name

        if ($latest_filename -eq $null){
            ErrorLogger "NO FILE TO UPLOAD WERE FOUND SCRIPT IS NOW ABORTING";
            exit(1)
        }

        Logger("The following file will be sent to the server : $latest_filename");
        Logger("!!! YOU CAN ABORT THE OPERATION WITH [CTRL + C] !!!");
        sleep 5

        # THIS WAS A SPECIFIC PROCESS FOR ME YOU CAN REMOVE IT 
        $fileSplittedInfos=$latest_filename.Split("-");
        $campain = $fileSplittedInfos[1].Trim();
        $folderDate = $(Get-Date -Format "yyyy-MM").Trim();
        $directory = $session.ListDirectory('/');

        Write-Host ">>> SHOWING REMOTE SERVER CONTENT <<<"
        foreach ($fileInfo in $directory.Files)
        {
            Write-Host ("**> [$($fileInfo.Name)] with size | $($fileInfo.Length) |, " +
                "permissions [$($fileInfo.FilePermissions)] and " +
                "last modification at | $($fileInfo.LastWriteTime) |")
        }

        Write-Host "------------------------------------------------"
        Logger("DETECTED CAMPAIN IS [$campain]")
        Logger("DETECTED MONTH DATE IS [$folderDate]")
        Logger("!!! YOU CAN ABORT THE OPERATION WITH [CTRL + C] !!!");
        Write-Host "------------------------------------------------"
        sleep 5

        Write-Host("****************************************");
        Logger("STARTING FILE UPLOAD TO REMOTE SERVER")
        Write-Host("****************************************");
        
        UploadFile $campain $folderDate $latest_filename;
       
    }catch {
        ErrorLogger("CAN'T CONNECT TO THE SFTP SERVER")
        ErrorLogger($($_.Exception.Message))

        exit 1
    }
    finally
    {
        # Disconnect, clean up
        $session.Dispose()
    }
 
    exit 0
}
catch
{
    Logger("SOMETHING WEN'T WRONG")
    Logger("$($_.Exception.Message)")
    exit 1
}


