# We start from a uv image to make life easier.
FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

RUN apt-get update -y && apt-get install -y \
    build-essential \
    git \
    cmake \
    g++ \
    gcc \
    gfortran \
    openmpi-bin \
    python3 \
    liblapack3 \
    python3-venv \
    libpython3.6 \
    hdf5-tools \
    ffmpeg \
    less \
    libc6 \
    libevent-2.1-7 \
    libevent-pthreads-2.1-7 \
    libexpat1 \
    libfftw3-double3 \
    libgcc-s1 \
    libgomp1 \
    libhwloc15 \
    libltdl7 \
    libopenmpi3 \
    libpng16-16 \
    libpython3.8 \
    libstdc++6 \
    libudev1 \
    libvoro++1 \
    libzstd1 \
    zlib1g \
    libreadline8 \
    mpi-default-bin \
    python3-dev \
    python3-pip \
    python3-pkg-resources \
    python3-setuptools \
    rsync \
    ssh \
    vim-nox \
    valgrind \
    gdb \
    zstd \
    libopenmpi-dev

RUN mkdir -p code && \
    cd code && \
    git clone https://github.com/advancesoftcorp/lammps.git && \
    mkdir -p lammps/build-serial && \
    cd lammps/build-serial && \
    cmake -C ../cmake/presets/basic.cmake -D BUILD_SHARED_LIBS=on -D LAMMPS_EXCEPTIONS=on -D PKG_PYTHON=on -D PKG_ML-GNNP=on -D PKG_ML-SNAP=on -D PKG_EXTRA-COMPUTE=on -D PKG_EXTRA-FIX=on -D PKG_MANYBODY=on -D PKG_EXTRA-DUMP=on -D PKG_MOLECULE=on ../cmake && \
    make -j 8 && \
    make install && \
    cp lmp /usr/local/bin

ENV PATH="/usr/local/bin:${PATH}"
ENV PYTHONPATH="/code/lammps/src/ML-GNNP"
