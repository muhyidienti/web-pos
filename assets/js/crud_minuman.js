function hapus(id) {
	$.ajax({
		url: base_url + "Dashboard/hapus_minuman",
		type: "POST",
		data: {
			id: id,
		},
		dataType: "json",
		success: function (data) {
			swal("Berhasil", "Data Minuman Berhasil Di hapus", "success");
			reload_table(datatabel);
		},
	});
}

function editdata(id) {
	$.ajax({
		url: base_url + "dashboard/getdatabyid_minuman",
		type: "POST",
		data: {
			id: id,
		},
		dataType: "json",
		success: function (data) {
			$("#id").val(data.id);
			$("#kategori").val(data.kategori);
			$("#nama_minuman").val(data.nama);
			$("#harga_minuman").val(data.harga);

			let buttonedit = `
            <button type="button" class="btn btn-warning" id="btnedit" >Edit</button>
            <button type="button" class="btn btn-info" onclick="button_cancel()" >Close</button>
            `;
			$("#button_").html(buttonedit);

			$("#btnedit").click(function (event) {
				event.preventDefault();

				let new_form = $("#form_tambah")[0];
				let data = new FormData(new_form);

				$.ajax({
					url: base_url + "dashboard/updatedata_minuman",
					enctype: "multipart/form-data",
					processData: false,
					contentType: false,
					cache: false,
					type: "POST",
					data: data,
					dataType: "json",
					success: function () {
						$("#id").val("");
						$("#kategori").val("");
						$("#nama_minuman").val("");
						$("#harga_minuman").val("");
						$("#gambar_minuman").val("");
						$("#exampleModal").modal("hide");
						swal("Berhasil", "Data Minuman Berhasil Diubah", "success");
						reload_table(datatabel);
						cancel();
					},
				});
			});
		},
	});
}

function button_cancel() {
	$("#exampleModal").modal("hide");
}

function cancel() {
	$("#kategori").val("");
	$("#nama_minuman").val("");
	$("#harga_minuman").val("");
	let buttontambah = `
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    <button type="submit" class="btn btn-info" id="btnsubmit">Save Data</button>
                `;
	$("#button_").html(buttontambah);
}

$("#buttoncancel").click(function () {
	$("#exampleModal").modal("hide");
	cancel();
});

function reload_table(table) {
	table.ajax.reload();
}

$(document).ready(function () {
	$("#btnsubmit").click(function (event) {
		event.preventDefault();

		let isi_form = $("#form_tambah")[0];
		let data = new FormData(isi_form);
		$.ajax({
			url: base_url + "dashboard/tambah_minuman",
			enctype: "multipart/form-data",
			processData: false,
			contentType: false,
			cache: false,
			type: "POST",
			data: data,
			dataType: "json",
			success: function (data) {
				$("#kategori").val("Minuman");
				$("#nama_minuman").val("");
				$("#harga_minuman").val("");
				$("#gambar_minuman").val("");
				$("#exampleModal").modal("hide");
				swal("Berhasil", "Data Minuman Berhasil Ditambahkan", "success");
				reload_table(datatabel);
			},
		});
	});

	datatabel = $("#datatabel_minuman").DataTable({
		dom: "rt",
		aaSorting: [],
		scrollY: "600px",
		scrollX: true,
		scrollCollapse: true,
		paging: false,
		fixedColumns: {
			leftColumns: 1,
			rightColumns: 1,
		},
		retrieve: true,
		processing: true,
		ajax: {
			type: "GET",
			url: base_url + "Dashboard/tampildata_minuman",
			dataSrc: "",
			dataType: "json",
		},
		columns: [
			{
				render: function (full, type, data, meta) {
					return data.kategori;
				},
			},
			{
				render: function (full, type, data, meta) {
					return data.nama;
				},
			},
			{
				render: function (full, type, data, meta) {
					return data.harga;
				},
			},
			{
				render: function (full, type, data, meta) {
					return `

                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModal" onclick='editdata(${data.id})' style="margin-left: 5px">
                        <i class="fa fa-edit"></i>
                    </button>
                    <button type="button" class="btn btn-danger" onclick='hapus(${data.id})'>
                        <i class="fa fa-trash"></i>
                    </button>
                    `;
				},
			},
		],
	});
});
