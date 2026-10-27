<#
.SYNOPSIS
  Instala a skill professor-dia-a-dia e o comando /curso numa ferramenta de IA (Windows).

.EXAMPLE
  .\scripts\install.ps1 -Ferramenta antigravity -Projeto C:\projetos\labstore

.PARAMETER Ferramenta
  antigravity | claude | codex | cursor | gemini | todas

.PARAMETER Projeto
  Pasta onde o aluno vai programar (padrão: pasta atual).
#>
param(
  [Parameter(Mandatory = $true)]
  [ValidateSet('antigravity', 'claude', 'codex', 'cursor', 'gemini', 'todas')]
  [string]$Ferramenta,

  [string]$Projeto = (Get-Location).Path
)

$ErrorActionPreference = 'Stop'

$RepoDir  = Split-Path -Parent $PSScriptRoot
$SkillSrc = Join-Path $RepoDir 'skills\professor-dia-a-dia'

New-Item -ItemType Directory -Force -Path $Projeto | Out-Null
$Projeto = (Resolve-Path $Projeto).Path

function Copy-Skill([string]$destRoot) {
  $dest = Join-Path $destRoot 'professor-dia-a-dia'
  New-Item -ItemType Directory -Force -Path $destRoot | Out-Null
  if (Test-Path $dest) { Remove-Item -Recurse -Force $dest }
  Copy-Item -Recurse $SkillSrc $dest
  Write-Host "  skill   -> $dest"
}

function Copy-Command([string]$src, [string]$dest) {
  New-Item -ItemType Directory -Force -Path (Split-Path -Parent $dest) | Out-Null
  Copy-Item -Force $src $dest
  Write-Host "  comando -> $dest"
}

function Install-Antigravity {
  Write-Host 'Antigravity:'
  Copy-Skill (Join-Path $Projeto '.agent\skills')
  Copy-Command (Join-Path $RepoDir 'integrations\antigravity\workflows\curso.md') (Join-Path $Projeto '.agent\workflows\curso.md')
}

function Install-Claude {
  Write-Host 'Claude Code:'
  Copy-Skill (Join-Path $Projeto '.claude\skills')
  Copy-Command (Join-Path $RepoDir 'commands\curso.md') (Join-Path $Projeto '.claude\commands\curso.md')
}

function Install-Codex {
  Write-Host 'Codex:'
  Copy-Skill (Join-Path $Projeto '.agents\skills')
  Copy-Command (Join-Path $RepoDir 'integrations\codex\prompts\curso.md') (Join-Path $HOME '.codex\prompts\curso.md')
}

function Install-Cursor {
  Write-Host 'Cursor:'
  Copy-Skill (Join-Path $Projeto '.cursor\skills')
  Copy-Command (Join-Path $RepoDir 'integrations\cursor\commands\curso.md') (Join-Path $Projeto '.cursor\commands\curso.md')
}

function Install-Gemini {
  Write-Host 'Gemini CLI:'
  Copy-Skill (Join-Path $Projeto '.gemini\skills')
  Copy-Command (Join-Path $RepoDir 'integrations\gemini\commands\curso.toml') (Join-Path $Projeto '.gemini\commands\curso.toml')
}

switch ($Ferramenta) {
  'antigravity' { Install-Antigravity }
  'claude'      { Install-Claude }
  'codex'       { Install-Codex }
  'cursor'      { Install-Cursor }
  'gemini'      { Install-Gemini }
  'todas'       { Install-Antigravity; Install-Claude; Install-Codex; Install-Cursor; Install-Gemini }
}

Write-Host ''
Write-Host "Pronto! Abra o projeto em $Projeto na ferramenta e digite /curso."
