<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>ATOM</title>
  <script src="../../scripts/atom/jquery.1.11.2.min.js"></script>
  <!-- datetime, date, time -->
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
  </script>
</head>

<body>
  <div class="header"></div>
  <div class="wrap">
    <div class="content">
      <ul class="breadcrumb">
        <li>ATOM</li>
        <li>Configuration</li>
        <li class="now">Resource Configuration</li>
      </ul>
      <h2 class="h2">Resource Configuration</h2>
      <div class="cont_wrap">
        <ul class="tab_menu type_02">
          <li class="active"><!-- Selected tab -->
            <a href="#none"><span class="txt">ATOM</span></a>
          </li>
          <li>
            <a href="#none"><span class="txt">Package</span></a>
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
              <ul class="side_menu">
                <li><a href="#none">MEMORY</a></li>
                <li class="active"><a href="#none">DISK</a></li>
                <li><a href="#none">TOTAL_CPU</a></li>
                <li><a href="#none">PROCESS_STATUS</a></li>
                <li><a href="#none">JAVA_THREAD</a></li>
                <li><a href="#none">THINGPLUG_CONTROL_TEXT_TEXT</a></li>
                <li><a href="#none">THINGPLUG_REMOTECSE_TEXT_TEXT</a></li>
                <li><a href="#none">THINGPLUG_REPORT_TEXT_TEXT</a></li>
                <li><a href="#none">THINGPLUG_SUBSCRIPTIO</a></li>
                <li><a href="#none">THINGPLUG_DIFFTIME</a></li>
                <li><a href="#none">JOB_QUEUE</a></li>
                <li><a href="#none">OS_QUEUE</a></li>
                <li><a href="#none">THINGPLUG_IS_LOCATION_TEXT_TEXT</a></li>
                <li><a href="#none">THINGPLUG_DELAYTIME</a></li>
              </ul>
            </div>
          </div>
          <div class="cell">
            <div class="box">
              <div class="loading hide"><span></span></div>
              <div class="search_message hide">선택된 내용이 없습니다.<br>왼쪽에서 Resource를 선택해 주십시오.</div>
              <div class="table type_03 detail">
                <table>
                  <tbody>
                    <tr>
                      <th>
                        <span class="imp">Resource Group Configuration</span>
                      </th>
                      <td>
                        <!-- Atom Resource -->
                        <table class="td_value">
                          <tr>
                            <td class="s">
                              <span class="label">Use Resource Group</span>
                              <div class="switch type_01">
                                <input type="checkbox" id="temp_id_11" checked disabled>
                                <label for="temp_id_11"></label>
                              </div>
                            </td>
                            <td class="s">
                              <span class="label">Monitoring Period</span>
                              <div class="value">100</div>
                              <span class="unit">secs</span>
                            </td>
                          </tr>
                          <tr>
                            <td class="s">
                              <span class="label">Collect Statistics</span>
                              <div class="switch type_01">
                                <input type="checkbox" id="temp_id_12" disabled>
                                <label for="temp_id_12"></label>
                              </div>
                            </td>
                            <td class="s">
                              <span class="label">Statistics Period</span>
                              <div class="value">20</div>
                              <span class="unit">mins</span>
                            </td>
                          </tr>
                        </table>
                        <!-- Node Resource -->
                        <table class="td_value hide">
                          <tr>
                            <td class="s">
                              <span class="label">Use Flag</span>
                              <div class="switch type_01">
                                <input type="checkbox" id="temp_id_13" checked disabled>
                                <label for="temp_id_13"></label>
                              </div>
                            </td>
                            <td class="s">
                              <span class="label">File Creation Cycle</span>
                              <div class="value">100</div>
                              <span class="unit">secs</span>
                            </td>
                          </tr>
                          <tr>
                            <td class="s">
                              <span class="label">Collect Statistics</span>
                              <div class="switch type_01">
                                <input type="checkbox" id="temp_id_14" disabled>
                                <label for="temp_id_14"></label>
                              </div>
                            </td>
                            <td class="s">
                              <span class="label">Statistics Period</span>
                              <div class="value">20</div>
                              <span class="unit">mins</span>
                            </td>
                            <td>
                              <span class="label">Metric Name</span>
                              <div class="value">connection.status</div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <th>
                        <span class="imp">Resource Configuration</span>
                      </th>
                      <td>
                        <div class="board_top">
                          <div class="cell nth_01">
                            <span class="value"><em>30</em>rows</span>
                          </div>
                        </div>
                        <!-- 조회결과 -->
                        <div class="table type_04 y_scroll">
                          <div class="thead">
                            <table>
                              <colgroup>
                                <col style="width:*;">
                                <col style="width:140px;">
                                <col style="width:*;">
                                <col style="width:140px;">
                              </colgroup>
                              <thead>
                                <tr>
                                  <th scope="col" class="">Action Name</th>
                                  <th scope="col" class="tac">Use / Unused</th>
                                  <th scope="col" class="">Action Name</th>
                                  <th scope="col" class="tac">Use / Unused</th>
                                </tr>
                              </thead>
                            </table>
                          </div>
                          <div class="tbody">
                            <table>
                              <colgroup>
                                <col style="width:*;">
                                <col style="width:140px;">
                                <col style="width:*;">
                                <col style="width:140px;">
                              </colgroup>
                              <tbody>
                                <tr>
                                  <td>ACTION_001</td>
                                  <td class="tac br_line">
                                    <div class="switch type_01">
                                      <input type="checkbox" id="temp_id_21" checked disabled>
                                      <label for="temp_id_21"></label>
                                    </div>
                                  </td>
                                  <td>ACTION_001</td>
                                  <td class="tac">
                                    <div class="switch type_01">
                                      <input type="checkbox" id="temp_id_22" checked disabled>
                                      <label for="temp_id_22"></label>
                                    </div>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>

                        <!-- Loading중 일때-->
                        <!-- <div class="board_top">
                          <div class="cell nth_01">
                            <span class="value"><em>0</em>rows</span>
                          </div>
                        </div>
                        <div class="table type_04 y_scroll"> -->
                          <!-- Loading -->
                          <!-- <div class="load_wrap">
                            <div class="loading"><span></span></div>
                          </div>
                        </div> -->

                        <!-- 내용이 없을때 -->
                        <!-- <div class="board_top">
                          <div class="cell nth_01">
                            <span class="value"><em>0</em>rows</span>
                          </div>
                        </div>
                        <div class="table type_04 y_scroll">
                          <div class="thead">
                            <table>
                              <colgroup>
                                <col style="width:*;">
                                <col style="width:140px;">
                                <col style="width:*;">
                                <col style="width:140px;">
                              </colgroup>
                              <thead>
                                <tr>
                                  <th scope="col" class="">Action Name</th>
                                  <th scope="col" class="tac">Use / Unused</th>
                                  <th scope="col" class="">Action Name</th>
                                  <th scope="col" class="tac">Use / Unused</th>
                                </tr>
                              </thead>
                            </table>
                          </div> -->
                          <!-- 내용이 없을 때 -->
                          <!-- <div class="no_data">
                            There is no Data.
                          </div>
                        </div> -->
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div class="cont_footer type_01">
          <div class="btn_area">
            <button type="button" class="btn type_01">Modify</button>
          </div>
        </div>
      </div>
      <!--//cont_wrap-->
    </div>
  </div>
</body>

</html>