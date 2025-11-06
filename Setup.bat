@echo off
title Setup - Projeto Classificação do Câncer de Mama
echo ============================================
echo   CONFIGURANDO AMBIENTE DO PROJETO
echo   Classificacao do Cancer de Mama
echo ============================================

:: 1. Ativar suporte a long path (para evitar erro de OSError)
echo Ativando suporte a long path no Windows...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v LongPathsEnabled /t REG_DWORD /d 1 /f >nul 2>&1

:: 2. Criar ambiente virtual (se nao existir)
if not exist "venv" (
    echo Criando ambiente virtual...
    python -m venv venv
)

:: 3. Ativar ambiente virtual
echo Ativando ambiente virtual...
call venv\Scripts\activate

:: 4. Atualizar pip
echo Atualizando pip...
python -m pip install --upgrade pip setuptools wheel

:: 5. Instalar dependencias do projeto
echo Instalando dependencias do requirements.txt...
pip install -r "requirements\requirements.txt"

:: 6. Criar kernel Jupyter
echo Registrando kernel do Jupyter...
python -m ipykernel install --user --name=cancer_mama_env --display-name "Python (Cancer de Mama)"

echo ============================================
echo   SETUP CONCLUIDO COM SUCESSO!
echo   Kernel 'Python (Cancer de Mama)' disponivel no Jupyter
echo ============================================

pause