<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>서울시 자치구 별 인구 현황</title>
  <script src="../../scripts/atom/jquery.1.11.2.min.js"></script>
  <!-- datetime, date, time -->
  <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
  <script src="../../scripts/atom/datetimepicker.moment.js"></script>
  <script src="../../scripts/atom/datetimepicker.js"></script>
  <!-- multiselect -->
  <script src="../../scripts/atom/bootstrap-multiselect.js"></script>
  <!-- 공통작성 -->
  <script src="../../scripts/atom/ui_common.js"></script>
  <link rel="shortcut icon" type="image/x-icon" href="../../images/atom/favicon.ico">
  <link rel="stylesheet" href="../../styles/atom/style.css">
  <link rel="stylesheet" href="../../styles/thingplug/thingplug.css">
  <script>
    $(document).ready(function () {
      getLists();
    });
    function getLists(){
      $.ajax({
        type: "GET",
        url: "/names.ajax",
        success: function (result) {
          $('#list').empty();
          for (var i = 0; i < result.length; i++) {
            $('#list').append(
              '<li>'+
              '<a href="../view/'+result[i]+'">'+
              '<h3>'+result[i]+'</h3>'+
              '</a>'+
              '</li>'
            )
          }
        }
      })}
      function ref(){
        $.ajax({
        type: "GET",
        url: "/refrash",
        success: function (result) {
         if(result){
           alert("데이터 갱신!")
           location.reload(true)
         }else{
           alert("현재 최신 데이터입니다.")
         }
        }
        })}
      
  </script>
</head>

<body>
  <div class="header"></div>
  <div class="wrap">
    <div class="content">
      <h2 class="h2">국내 Covid19 감염 현황</h2>
      <div class="cont_wrap">
        <ul class="tab_menu type_02">
          <li class="active">
            <!-- Selected tab -->
            <a href="/"><span class="txt">국내현황</span></a>
          </li>
        </ul>
        <div class="search_area auto hidden">
          <div class="search_box">
            <table>
              <tbody>
                <tr>
                  <th>Package</th>
                  <td>
                    <div class="select type_01 m">
                      <select id="select_temp_id_0">
                        <option value="1">select m</option>
                        <option value="2">option_01</option>
                        <option value="3">option_02</option>
                      </select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th>Node</th>
                  <td>
                    <div class="select type_01 m">
                      <select id="select_temp_id_1">
                        <option value="1">select m</option>
                        <option value="2">option_01</option>
                        <option value="3">option_02</option>
                      </select>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="btn_box">
            <button type="button" class="btn search">
              Search
            </button>
          </div>
        </div>
        <div class="layout type_01">
          <div class="cell type_01">
            <div class="box">
              <div class="loading hide"><span></span></div>
              <div class="search_message hide">검색하신 내용이 없습니다.<br>Package와 Node를 선택해 주십시오.</div>
              <ul id="list" class="side_menu">
              </ul>
            </div>
          </div>
          <div class="cell">
            <div class="box">
              <div class="table type_03 detail" style="height: 715px;">
                <table>
                  <tbody>
                    <tr>
                      <th>
                        <span>
                          <h2>${item.gubun}</h2>
                        </span>
                      </th>
                      <td>
                        <!-- Atom Resource -->
                        <table class="td_value">
                          <tr>
                            <td class="s"></td>
                            <td>
                              <span class="label">
                                <h2>금일 신규 발생</h2>
                              </span>
                              <div class="value">
                                <h2> ${item.incDec} </h2>
                              </div>
                            </td>
                            <form action="view" id="gigan">
                              <td class="s">
                                <span class="label">
                                  <h2>기간 입력 2010.01 ~ 2020.07</h2>
                                </span>
                                <input id="gigan" type="month" size="30" name="gigan">
                                <input type="hidden" name="jachigu" value="${row.JACHIGU}"><br />
                                <button class="btn type_02 primary" type="submit" form="gigan">조회</button>
                              </td>
                            </form>
                          </tr>
               
                            <button class="btn type_02 primary" onclick="ref();">데이터갱신</button>
                        
                          <tr>
                            <td class="s"></td>
                            <td class="s">
                              <span class="label">
                                <h2>사망자 수</h2>
                              </span>
                              <div class="value">
                                <h2>${item.deathCnt}</h2>
                              </div>
                              <span class="unit"></span>
                            </td>
                          </tr>
                        </table>
                    <tr>
                      <th>
                        <span>
                          <h2>상세 현황</h2>
                        </span>
                      </th>
                      <td>
                        <div class="thead">
                          <table>
                            <thead>
                              <tr>
                                <th scope="col" class="tac">
                                  <h2>시도명(한글)</h2>
                                </th>
                                <th scope="col" class="tac">
                                  <h2>시도명(중국)</h2>
                                </th>
                                <th scope="col" class="tac">
                                  <h2>시도명(영어)</h2>
                                </th>
                              </tr>
                            </thead>
                          </table>
                        </div>
                        <div class="tbody">
                          <table>
                            <tbody>
                              <tr>
                                <td class="tac">
                                  <h2> ${item.gubun} </h2>
                                </td>
                                <td class="tac">
                                  <h2> ${item.gubunCn} </h2>
                                </td>
                                <td class="tac">
                                  <h2> ${item.gubunEn}</h2>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                        <br />
                        <br />
                        <div class="thead">
                          <table>
                            <thead>
                              <tr>
                                <th scope="col" class="tac">
                                  <h2>격리 해제 수</h2>
                                </th>
                                <th scope="col" class="tac">
                                  <h2>10만명 당 발생률</h2>
                                </th>
                                <th scope="col" class="tac">
                                  <h2>기준일시</h2>
                                </th>
                              </tr>
                            </thead>
                          </table>
                        </div>
                        <div class="tbody">
                          <table>
                            <tbody>
                              <tr>
                                <td class="tac">
                                  <h2> ${item.isolClearCnt}</h2>
                                </td>
                                <td class="tac">
                                  <h2> ${item.qurRate}</h2>
                                </td>
                                <td class="tac">
                                  <h2> ${item.stdDay}</h2>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                        <br />
                        <br />
                        
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>