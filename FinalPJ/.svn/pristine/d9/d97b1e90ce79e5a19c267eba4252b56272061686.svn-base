<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<style>
  .button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #2196f3;
    color: #fff;
    border-radius: 30px;
    border: none;
    box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease 0s;
    cursor: pointer;
  }

  .button:hover {
    background-color: #1976d2;
  }

  .grid-stack-item {
    width: 500px;
    height: 500px;
  }
  .grid-stack-item-content{
    border: 2px solid greenyellow;
  }
</style>
<h1>통계/실적 페이지입니다.</h1>

<div class="grid-stack">
	<div class="grid-stack-item grid1" gs-x="2" gs-y="2" gs-w="4" gs-h="5">
		<div class="grid-stack-item-content tb" id="">
		gg
		</div>
	</div>
    <div class="grid-stack-item grid1" gs-x="6" gs-y="2" gs-w="4" gs-h="5">
      <div class="grid-stack-item-content tb" id="noticeBoardDivGrid">
        <div class="chartSize">
          <canvas id="myChart"></canvas>
        </div>
        
        <div style="margin-left:100px;">
        	<br><br>
	        <input class="button" type="button" value="월별" onclick="f_chart1()" />
	        <input class="button" type="button" value="부위별" onclick="f_chart2()" />
	        <input class="button" type="button" value="연령별" onclick="f_chart3()" />
        </div>
      </div>
    </div>
  </div>


<script>
    var grid = GridStack.init({});
    $("tbody:not(.disable)").on("click", ".datatr", function (event) {
      $(this).siblings(".datatr").removeClass("active");
      $(this).toggleClass("active");
    });

    function f_chart1() {
      $.ajax({
        method: 'get',
        url: 'salesRevenue.csv',
        dataType: 'text',
        success: function (res) {
          myChart.data.datasets[0].data = res.split(','); // split은 배열 리턴
          myChart.data.labels = ['1월', '2월', '3월', '4월', '5월', '6월'];
          myChart.update(); // 랜더링
        },
        error: function (xhr, status, error) {
          // 요청이 실패하면 실행할 콜백 함수
        }
      });
    }
    function f_chart2() {
      $.ajax({
        method: 'get',
        url: 'test.csv',
        dataType: 'text',
        success: function (res) {
          myChart.data.datasets[0].data = res.split(','); // split은 배열 리턴
          myChart.data.labels = ['팔', '다리', '손가락', '발목', '어깨', '허리'];
          myChart.update(); // 랜더링
        },
        error: function (xhr, status, error) {
          // 요청이 실패하면 실행할 콜백 함수
        }
      });
    }
    function f_chart3() {
      $.ajax({
        method: 'get',
        url: 'test2.csv',
        dataType: 'text',
        success: function (res) {
          myChart.data.datasets[0].data = res.split(','); // split은 배열 리턴
          myChart.data.labels = ['10대', '20대', '30대', '40대', '50대', '60대'];
          myChart.update(); // 랜더링
        },
        error: function (xhr, status, error) {
          // 요청이 실패하면 실행할 콜백 함수
        }
      });
    }

    const ctx = document.querySelector('#myChart');

    var myChart = new Chart(ctx, {
      type: 'doughnut', // 이건 생성때만 되고 변경할때는 안됨!
      data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [
          {
            label: '# 작년',
            data: [0, 0, 0, 0, 0, 0],
            borderWidth: 1,
          },
        ],
      },
      options: {
        scales: {
          y: {
            beginAtZero: true,
          },
        },
      },
    });
  </script>