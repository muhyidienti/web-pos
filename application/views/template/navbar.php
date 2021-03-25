<body>
    <script>
        const base_url = '<?= base_url(); ?>'
    </script>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#"> <strong> Rumah Makan Berkah</strong></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse text-right" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active ">
                    <a class="nav-link" href="<?= base_url('dashboard/index') ?>">Kelola Data <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active ">
                    <a class="nav-link t" href="<?= base_url('transaksi/tampil_makanan') ?>">Pembayaran</a>
                </li>
            </ul>
        </div>
    </nav>