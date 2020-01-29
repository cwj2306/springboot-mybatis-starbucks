<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../admin/nav.jsp"%>
<li class="breadcrumb-item active">Tables</li>
</ol>

<!-- DataTables Example -->
<div class="card mb-3">
	<div class="card-header">
		<i class="fas fa-table"></i>커피 판매 현황
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>고객번호</th>
						<th>상품이름</th>
						<th>구매일</th>
						<th>가격</th>
						<th>수량</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>고객번호</th>
						<th>상품이름</th>
						<th>구매일</th>
						<th>총 판매액 0원</th>
						<th>총 판매수량 0개 </th>
					</tr>
				</tfoot>
				<tbody>

				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="card-footer small text-muted">Updated yesterday at
		11:59 PM</div>
<p class="small text-center text-muted my-5">
	<em>More table examples coming soon...</em>
</p>

</div>
<!-- /.container-fluid -->



</div>
<!-- /.content-wrapper -->

</div>
<!-- /#wrapper -->

<!-- Sticky Footer -->
<footer class="sticky-footer">
	<div class="container my-auto">
		<div class="copyright text-center my-auto">
			<span>Copyright © Your Website 2019</span>
		</div>
	</div>
</footer>
<%@include file="../admin/footer.jsp"%>

<!-- Bootstrap core JavaScript-->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Page level plugin JavaScript-->
<script src="../vendor/datatables/jquery.dataTables.js"></script>
<script src="../vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- Custom scripts for all pages-->
<script src="../js/sb-admin.min.js"></script>

<!-- Demo scripts for this page-->
<script src="../js/demo/datatables-demo.js"></script>

</body>

</html>
