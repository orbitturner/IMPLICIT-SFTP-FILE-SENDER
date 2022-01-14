# 🟢 Array Querier 🔎
[![Compatible Status](https://img.shields.io/badge/works%20with-PS1-blue)](https://github.com/orbitturner/IMPLICIT-SFTP-FILE-SENDER)
[![Code Size Status](https://img.shields.io/github/languages/code-size/orbitturner/IMPLICIT-SFTP-FILE-SENDER)](https://github.com/orbitturner/IMPLICIT-SFTP-FILE-SENDER)
[![Commit Status](https://img.shields.io/github/commit-activity/m/orbitturner/IMPLICIT-SFTP-FILE-SENDER?color=red)](https://github.com/orbitturner/IMPLICIT-SFTP-FILE-SENDER)
[![Issues Status](https://img.shields.io/github/issues/orbitturner/IMPLICIT-SFTP-FILE-SENDER)](https://github.com/orbitturner/IMPLICIT-SFTP-FILE-SENDER)
[![npm version](https://img.shields.io/npm/v/IMPLICIT-SFTP-FILE-SENDER.svg)](https://github.com/orbitturner/IMPLICIT-SFTP-FILE-SENDER) [![license](https://img.shields.io/npm/l/IMPLICIT-SFTP-FILE-SENDER.svg)](https://github.com/orbitturner/IMPLICIT-SFTP-FILE-SENDER)

**IMPLICIT-SFTP-FILE-SENDER** is a Powershell script using [WINSCP](https://winscp.net/) for sending files to an Remote Implicit SFTP server. The program also have File Change detection system for sending automatically the most recent File in the **[CONTAINER]** folder.

<p align="center">
  <a href="http://orbitturner.com/"><img src="./.repo-assets/images/GITHUB REPOS COVER.gif" width="auto" alt="IMPLICIT-SFTP-FILE-SENDER COVER"/></a>
</p>


<h1 align="center">INSTALLATION</h1>
<p align="center">
<a href="https://github.com/orbitturner/IMPLICIT-SFTP-FILE-SENDER"><img src="https://img.shields.io/badge/DOWNLOAD-LATEST%20VERSION-lime?style=for-the-badge&logo=docusign&logoColor=lime"></a>
<a href="https://github.com/orbitturner/IMPLICIT-SFTP-FILE-SENDER/issues/new/choose"><img src="https://img.shields.io/badge/ISSUES-CREATE%20AN%20ISSUE-crimson?style=for-the-badge&logo=indeed&logoColor=CRIMSON"></a>
</p>
<br/>

___
## 📚 Table Of Contents 📑
- [🟢 Array Querier 🔎](#---array-querier---)
  * [📚 Table Of Contents 📑](#---table-of-contents---)
  * [💨 What is this Library for? 🤔](#---what-is-this-library-for----)
  * [✨ Key Features 🎯](#--key-features---)
  * [📥 HOW TO RUN IT ? 🔰](#---how-to-run-it-----)
  * [🤔 HOW IT WORKS ? 🤔](#---how-it-works-----)
  * [⚙ Usage: SERVER CONNECTION PARAMS 🎚](#--usage--server-connection-params---)
    + [➤ Open The SFTP-UPLOADER File 🟢](#--open-the-sftp-uploader-file---)
  * [Configuration Options](#configuration-options)
  * [Contributing ❤](#contributing--)
  * [Issue Reporting](#issue-reporting)
  * [GREETINGS](#greetings)
  * [Author](#author)
  * [License](#license)

___

## 💨 What is this Library for? 🤔

**IMPLICIT-SFTP-FILE-SENDER** is a small library that is useful for filtering a `One Level or Multi Level Depth` array of objects with `multiple match-criteria`. The exposed methods **receives** an **array as the first argument**, and **a plain object describing the fields to filter as the last argument**.


> **Note:** This library can only be used with Powershell or WSF but you already know that 🤦🏿‍♂️.



## ✨ Key Features 🎯

* Use it **without `Installation`**  because all the dependencies are `Provided`.
* **CHANGE AUTO DETECTION** by Event listeners attached in the CONTAINER folder.
* Optimized for Great Performance even with **Big Fat @/@ Files** .
* ✅ TOO EASY TO USE !! 🥳🥳

___

## 📥 HOW TO RUN IT ? 🔰

```bash
# RUN IT in Powershell CLI
.\ScriptLauncher.ps1

# or you may prefer
right click on 'ScriptLauncher.ps1' and Click on Run it With Powershell
```

**This SCRIPT relies on NOTHING SO YOU DON'T NEED ADDITIONNAL PACKAGES.**

___
## 🤔 HOW IT WORKS ? 🤔

You only need to execute the `ScriptLauncher.ps1` !

The program will then attach Events Listener to the `CONTAINER` Folder which will trigger an SFTP sending of the last elements put in this folder to the specified servers.


**That's It.**
___



## ⚙ Usage: SERVER CONNECTION PARAMS 🎚

### ➤ Open The SFTP-UPLOADER File 🟢

Then Go to the following lines (***70***) and Replace the defaults values with your server's props:

```powershell
    # Configurer les options de session
    $sessionOptions = New-Object WinSCP.SessionOptions -Property @{
        Protocol = [WinSCP.Protocol]::Ftp
        HostName = "XXX.XXX.XXX.XXX"
        UserName = "USERNAME"
        Password = "*********"
        FtpSecure = [WinSCP.FtpSecure]::Implicit # DON'T TOUCH THAT LINE.
        TlsHostCertificateFingerprint = "GET IT FROM WINSCP GENERATE SCRIPT PANEL"
    }
```
> **⚠ Note: ⚠** This script is made for `Developers` and Only For `SFTP Implicit servers` because it's hard to find a programmatical way to do such thing 🚨. You can easily tweak to fit your desires.

___
## Configuration Options

*Coming Soon !*
___
## Contributing ❤

👋🏾 Pull requests are welcome! 
___

## Issue Reporting

If you have found a bug or if you have a feature request, please report them at this repository issues section. Please do not report security vulnerabilities on the public GitHub issue tracker. The [Responsible Disclosure Program](mailto:support@orbitturner.com) details the procedure for disclosing security issues.
___

## GREETINGS
❤❤ *Coming Soon !* ❤❤

___
## Author

[Orbit Turner](https://orbitturner.com)

___
## License

This project is licensed under the MIT license. See the [LICENSE](LICENSE) file for more info.
______________________________________________________
**❤ MADE WITH LOVE ❤**

![Image of OT](https://raw.githubusercontent.com/orbitturner/orbitturner/master/LOGO-OT.png)

<img src="https://github.com/orbitturner/challenger/blob/master/images/OrbitTurner_Gaming_GitHubBadge.png?raw=true" align="right" />
