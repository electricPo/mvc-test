<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CASH BOOK</title>
<jsp:include page="/layout/cdn.jsp"></jsp:include>
</head>
<script>
    $(document).ready(function() {
    	
		const targetYear = ${targetYear};
		const targetMonth = ${targetMonth +1};
		const memberId = "${memberId}";
		console.log(targetYear+"trtrtr");
		console.log(targetMonth+"mmm");
		console.log(memberId+"ddd");
		
		//동기호출로 x와 y 값을 셋팅한다

		const x = [];
		const y = [];
	
		 $.ajax({
		        async: false,
		        url: '${pageContext.request.contextPath}/HomeRest',
		        type: 'get',
		        datatype: "json",
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        data: {
		            targetYear: targetYear,
		            targetMonth: targetMonth,
		            memberId: memberId
		        },
		        success: function(model) {
		        	console.log(model);
		            const parsedData = model;
		            console.log(parsedData);

		            const x = [];
		            const y = [];

		            parsedData.forEach(function(item, index){
						$('#target').append('<tr>');
						$('#target').append('<td>'+item.cashword+'</td>');
						$('#target').append('<td>'+item.cnt+'</td>');
						$('#target').append('</tr>');
						
						// chart모델 생성
						x.push(item.cashword);
						y.push(item.cnt);
						console.log(item.cashword);
					});


		            console.log("ajax성공");

		            new Chart("target2", {
		                type: "bar",
		                data: {
		                    labels: x,
		                    datasets: [{
		                        data: y
		                    }]
		                }
		            });
		        },
		        error: function() {
		            console.log("아작스실패");
		        }
		    });
		})

	</script>
<body class="home-body">

<jsp:include page="/layout/header.jsp"></jsp:include>
	<div class="row row-first">
		<section id="chart" class="col-lg-12">
			<div class="container">
				<h3>${memberId}님의 ${targetMonth +1}월 해시태그 사용 비율</h3>
				<!-- 이전달과 다음달로 이동하는 링크를 생성 -->
					<a href="${pageContext.request.contextPath}/home?targetYear=${targetYear}&targetMonth=${targetMonth-1}" class="emote"> &#x23EA; </a>
					<a href="${pageContext.request.contextPath}/home?targetYear=${targetYear}&targetMonth=${targetMonth+1}" class="emote"> &#x23E9; </a>
					<div class="row">
						<div   class="col-lg-8">
							<canvas id="target2" style="width:100%;max-width:800px"></canvas>
						</div>
						
						<div class="col-lg-4  text-center d-flex align-items-center">
							<div id="target">
							<table>
								<tr>
									<td>해시태그</td>
									<td>&nbsp;게시글수</td>
								</tr>
							</table>
							</div>
						</div>
						</div>
			</div>
					
			</div>
		</section>

	</div>
	<section id="counter" class="counter section-bg">
	    <div class="container" data-aos="fade-up">
	      <div class="section-title">
	        <div class="row">
	          <div class="counter-info">
	            <ul class="counter-list">
	              <li>현재접속자: ${currentCounter}</li>
	              <li>오늘접속자 수: ${counter}</li>
	              <li>누적접속자 수: ${totalCounter}</li>
	            </ul>
	          </div>
	        </div>
	      </div>
	    </div>
	</section>
    
 
<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>