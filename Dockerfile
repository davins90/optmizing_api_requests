FROM jupyter/datascience-notebook:python-3.10

# Imposta la directory di lavoro
WORKDIR /home/jovyan/src

# Copia requirements.txt nella directory di lavoro
COPY requirements.txt ./

# Installa le dipendenze
RUN pip install --no-cache-dir -r requirements.txt

# Cambia temporaneamente all'utente root per impostare i permessi
USER root
RUN chown -R jovyan:users /home/jovyan/src

# Torna all'utente non privilegiato
USER $NB_UID

# Espone la porta 8080
EXPOSE 8080

# Comando per avviare Jupyter Lab
CMD ["start-notebook.sh", "--NotebookApp.ip=0.0.0.0", "--NotebookApp.port=8080", "--NotebookApp.token=''", "--NotebookApp.allow_origin='*'"]
