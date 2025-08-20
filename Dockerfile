FROM mambaorg/micromamba:1.4.2

WORKDIR /workspace

# Create env with Python
RUN micromamba create -n fawa -c conda-forge -c defaults python=3.6 cmake -y

SHELL ["micromamba", "run", "-n", "fawa", "/bin/bash", "-c"]

# Install pip packages
RUN pip install tensorflow==1.15.0 calamari-ocr==0.3.5 cleverhans==3.0.1 \
    numpy==1.16.6 scipy==1.2.2 pillow==6.2.2 opencv-python==4.1.2.30 \
    scikit-image==0.14.5 tqdm==4.31.1 matplotlib==3.0.3 \
    scikit-learn==0.21.2 imageio==2.5.0 h5py==2.9.0 protobuf==3.6.1 \
    python-bidi==0.4.2

COPY . .

CMD ["python", "wm_grad.py"]