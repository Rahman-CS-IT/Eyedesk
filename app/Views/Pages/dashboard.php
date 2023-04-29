
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Custom CSS Link-->
    <link rel="stylesheet" href="<?php echo base_url() ?>/public/assets/css/dashboard.css">
    <script defer src="<?php echo base_url() ?>/public/assets/js/dash.js" type="text/javascript"></script>
</head>

<body>
    <section class="second-nav">
        <div class="left">
            <a class="today-btn" href="#">Today</a>
            <div class="leftarrow"><img src="<?php echo base_url() ?>/public/assets/image/polygon 10.png" alt=""></div>
            &nbsp;
            <div class="date-picker">

                <div class="date-picker__selected-date"></div>

                <div class="dates">
                    <div class="month-wrapper">

                        <div class="arrow prv-month">
                            &lt;
                        </div>

                        <div class="month">
                        </div>

                        <div class="arrow nxt-month">
                            &gt;
                        </div>

                    </div>

                    <div class="days">
                        <div class="day">S</div>
                        <div class="day">M</div>
                        <div class="day">T</div>
                        <div class="day">W</div>
                        <div class="day">T</div>
                        <div class="day">F</div>
                        <div class="day">S</div>
                    </div>

                </div>
            </div>
            &nbsp;
            <div class="rightarrow"><img src="<?php echo base_url() ?>/public/assets/image/polygon 11.png" alt=""></div>
            <div class="scheduler">
                <img src="<?php echo base_url() ?>/public/assets/image/summary.png" alt="" width="25px">
            </div>
        </div>

        <div class="center"></div>

        <div class="right">
            <p>Others</p>
        </div>
    </section>

    <section class="dashboard">
        <div class="dashboard-left">
            <div class="container">
                <div class="box">
                    <div class="box-header">
                        <p>APPOINTMENT LIST TODAY</p>
                        <div class="box_toggleBtn">
                            <img src="<?php echo base_url() ?>/public/assets/image/minus.png" alt="minus">
                        </div>
                    </div>

                    <div class="box-body">
                        <div class="patient-status">
                            <ul>
                                <li>
                                    <p class="indication grey"></p>
                                    <p>Scheduled: <span></span></p>
                                </li>
                                <li>
                                    <p class="indication orange"></p>
                                    <p>Waiting: <span>0</span></p>
                                </li>
                                <li>
                                    <p class="indication yellow"></p>
                                    <p>Engaged: <span>0</span></p>
                                </li>
                                <li>
                                    <p class="indication green"></p>
                                    <p>Completed: <span>0</span></p>
                                </li>
                            </ul>
                        </div>

                        <div class="patient-table">
                            <table>
                                <thead>

                                <tr class="patient-table__header">
                                    <th></th>
                                    <th>#</th>
                                    <th>Patient ID</th>
                                    <th>Patient Name</th>
                                    <th>Scheduled Time</th>
                                    <th></th>
                                </tr>
                                </thead>
                               <tbody>
                                <?php
                                $i = 0;
                                if (!empty($fetch_data)) {

                                    $date = date('Y-m-d');
                                    foreach ($fetch_data as $row) {
                                        $start = $row->appointment_start_time;
                                        $start_time = date('h:i:s a', strtotime($start));
                                ?>
                                        <tr>
                                            <td></td>
                                            <td><?php echo ++$i
                                                ?></td>
                                            <td><?= $row->pat_id ?></td>
                                            <td><?= $row->firstname ?>&nbsp;
                                                <?= $row->lastname
                                                ?></td>

                                            <td><?= $start_time
                                                ?></td>
                                            <td>
                                                <p class="indicator grey"></p>
                                            </td>
                                        </tr>
                                    <?php
                                    }
                                }
                                
                                else {
                                    ?>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>No Appointments Today</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                <?php
                                }
                                ?>
                                   </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="box">
                    <div class="box-header">
                        <p>OT LIST TODAY</p>
                        <div class="box_toggleBtn">
                            <img src="<?php echo base_url() ?>/public/assets/image/minus.png" alt="minus">
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="patient-status">
                            <ul>
                                <li>
                                    <p class="indication grey"></p>
                                    <p>Scheduled: <span>0</span></p>
                                </li>
                                <li>
                                    <p class="indication yellow"></p>
                                    <p>Engaged: <span>1</span></p>
                                </li>
                                <li>
                                    <p class="indication green"></p>
                                    <p>Completed: <span>1</span></p>
                                </li>
                            </ul>
                        </div>

                        <div class="patient-table">
                            <table>
                                <tr class="patient-table__header">
                                    <th></th>
                                    <th>#</th>
                                    <th>Patient Name</th>
                                    <th>OT Time</th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td>No OTs</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="box">
                    <div class="box-header">
                        <p>ADMISSION LIST TODAY</p>
                        <div class="box_toggleBtn">
                            <img src="<?php echo base_url() ?>/public/assets/image/minus.png" alt="minus">
                        </div>
                    </div>

                    <div class="box-body">
                        <div class="patient-status">
                            <ul>
                                <li>
                                    <p class="indication grey"></p>
                                    <p>Scheduled: <span>0</span></p>
                                </li>
                                <li>
                                    <p class="indication green"></p>
                                    <p>Admitted: <span>1</span></p>
                                </li>
                            </ul>
                        </div>

                        <div class="patient-table">
                            <table>
                                <tr class="patient-table__header">
                                    <th></th>
                                    <th>#</th>
                                    <th>Patient Name</th>
                                    <th>Admission Time</th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>1</td>
                                    <td>Maria Anders</td>
                                    <td>10:45 AM</td>
                                    <td>
                                        <p class="indicator grey"></p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="box">
                    <div class="box-header">
                        <p>ADMITTED PATIENT LIST</p>
                        <div class="box_toggleBtn">
                            <img src="<?php echo base_url() ?>/public/assets/image/minus.png" alt="minus">
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="patient-status">
                            <ul>
                                <li>
                                    <p class="indication grey"></p>
                                    <p>Total: <span>0</span></p>
                                </li>
                            </ul>
                        </div>

                        <div class="patient-table">
                            <table>
                                <tr class="patient-table__header">
                                    <th></th>
                                    <th>#</th>
                                    <th>Patient Name</th>
                                    <th>Admission Date</th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td>No Admission</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                
                <div class="box">
                    <div class="box-header">
                        <p>DISCHARGE TODAY LIST</p>
                        <div class="box_toggleBtn">
                            <img src="<?php echo base_url() ?>/public/assets/image/minus.png" alt="minus">
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="patient-status">
                            <ul>
                                <li>
                                    <p class="indication green"></p>
                                    <p>Discharged: <span>1</span></p>
                                </li>
                            </ul>
                        </div>

                        <div class="patient-table">
                            <table>
                                <tr class="patient-table__header">
                                    <th></th>
                                    <th>#</th>
                                    <th>Patient Name</th>
                                    <th>Discharge Time</th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>1</td>
                                    <td>Cabral Lyra</td>
                                    <td>10:00 AM</td>
                                    <td>
                                        <p class="indicator green"></p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

            </div>

        </div>


        <div class="dashboard-right">
            <div class="container">
                <div class="box">
                    <div class="box-header">
                        <p>TASK LIST :</p>
                        <input type="text" placeholder="Enter Task Here" id="todo">
                        <div class="box_addBtn" id="todo-btn">
                            <img src="<?php echo base_url() ?>/public/assets/image/add.png" alt="">
                            <p>ADD</p>
                        </div>
                    </div>
                    <div class="box-body" id="todo-container">

                    </div>
                </div>
                <div class="box">
                    <div class="box-header">
                        <p>TODAY"S REPORT</p>
                        <div class="box_minusBtn">
                            <img src="<?php echo base_url() ?>/public/assets/image/minus.png" alt="">
                        </div>
                    </div>
                    <div class="box-body">

                    </div>
                </div>
                <div class="box">
                    <div class="box-header">
                        <p>TOTAL HOLIDAYS</p>
                        <div class="box_addBtn">
                            <img src="<?php echo base_url() ?>/public/assets/image/add.png" alt="">
                            <p>ADD/EDIT</p>
                        </div>
                    </div>
                    <div class="box-body">

                    </div>
                </div>
            </div>
        </div>
    </section>

</body>
</html>
