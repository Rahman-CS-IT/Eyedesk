<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Calendar</title>


    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>

    <link rel="stylesheet" href="<?php echo base_url() ?>/public/lib/main.css" />
    <link rel="stylesheet" href="<?php echo base_url() ?>/public/assets/css/opd_navbar.css" type="text/css">

    <link rel="stylesheet" href="<?php echo base_url() ?>/public/assets/css/navbar.css">


    <script src='<?php echo base_url() ?>/public/lib/main.js'></script>

    <style>
        #calendar {
            max-width: 1200px;
            margin-left: 300px;
        }
    </style>

</head>

<body>
    <!-- Navbar -->
    <section class="second-nav">
        <div class="left">

            <a class="today-btn" href="<?= previous_url() ?>"><img src="<?php echo base_url() ?>/public/assets/image/polygon 10.png" alt=""> <span>BACK</span>
            </a>
            <div class="search_p">
                <input type="text" placeholder="Search Patient">
                <input type="image" name="" id="" src="<?php echo base_url() ?>/public/assets/image/arrow.png">
            </div>
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

        <div class="right">
            <p>Appointment Details</p>
        </div>
    </section>
    <!-- /.navbar -->


    <div class="container-fluid">
        <!-- end row -->

        <div class="row justify-content-center ">
            <div class="card-body">

                <div class="container-fluid">
                    <div id="calendar"></div>
                </div>

                <div class="modal" tabindex="-1" id="cal_modal">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header row">
                                <div class="col-md-4">
                                </div>
                                <div class="col-md-6">
                                    <h5 class="modal-title">Appointment Details
                                    </h5>
                                </div>
                                <div class="col-md-1">
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                            </div>
                            <div class="modal-body">

                                <form id="suspend_form">
                                    <div class="row">
                                        <!-- <label class="mt-2">Appointment Details</label> -->
                                        <h5 class="modal-title"><span id="dis_error" class="text-danger"></span>
                                        </h5>
                                        <div class="row">

                                            <label class="mt-2">Type<span class="text-warning">*</span></label>

                                            <div class="mt-2 col-md-6">
                                                <input type="radio" name="appointmenttype" id="appointmenttype" value="Walk-in">
                                                <label>Walk-in</label>
                                            </div>

                                            <div class="mt-2 col-md-6">
                                                <input type="radio" name="appointmenttype" id="appointmenttype" value="Appointment">
                                                <label>Appointment</label>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="mt-2">Appointment Date<span class="text-warning">*</span></label>
                                                <div class="appt-datetime__input">
                                                    <input type="date" class="form-control" name="start" id="datefrom">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="mt-2">Apointment Time<span class="text-warning">*</span></label>
                                                <input type="time" class="form-control" id="timefrom" name="timestart">
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="mt-2">Location<span class="text-warning">*</span></label>

                                                <select class="form-control" id="location" name="location">
                                                    <option value="">Select Location</option>

                                                    <option value="aeh">AEH</option>
                                                    <option value="aec">AEC</option>
                                                    <option value="saf">SAF</option>

                                                </select>
                                            </div>

                                            <div class="col-md-6">
                                                <label class="mt-2">Consultant<span class="text-warning">*</span></label>

                                                <select class="form-control" id="consultant" name="consultant">
                                                    <?php if(!empty($result)):?>
                                                        <?php foreach ($result as $row):?>
                                                            <option value="<?=  $row->name ?>"><?=  $row->name ?></option>
                                                        <?php endforeach ?>
                                                        <?php else: ?>
                                                            <option value="">No Doctor Available</option>
                                                    <?php endif ?>
                                                </select>
                                            </div>

                                            <div class="appt-types">
                                                <div class="appt-types__input">
                                                    <div class="col-md-6">
                                                        <label class="mt-2">Appointment Type<span class="text-warning">*</span></label>

                                                        <select class="form-control" id="appointmentreason" name="appointmentreason">
                                                            <!-- <option value="review">Review</option>
                                                                <option value="walkin">Walk-In</option> -->
                                                            <option value="consultation">Consultation</option>
                                                            <option value="checkup">Checkup</option>
                                                            <option value="surgery">Surgery</option>

                                                        </select>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label class="mt-2">Categories<span class="text-warning">*</span></label>

                                                        <select class="form-control" id="appointmentcategory" name="appointmentcategory">
                                                            <option value="none">--Select Appointment Type--</option>
                                                            <option value="comprehensive">Comprehensive</option>
                                                            <option value="routine">Routine</option>
                                                            <option value="lens">Contact Lens</option>
                                                        </select>
                                                    </div>

                                                </div>

                                            </div>

                                            <p class="reservation">Reserved Slot for <span class="reservation_time"></span></p>
                                            <div id="calendar2" class="reservation-container">

                                            </div>
                                        </div>
                                    </div>

                                </form>

                            </div>
                            <div class="modal-footer">
                                <button type="button" id="save_events" class="btn btn-primary">Save</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal" tabindex="-1" id="update_cal_modal">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header row">
                                <div class="col-md-4"> <button type="button" class="btn btn-primary" id="del">Delete</button>
                                </div>
                                <div class="col-md-6">
                                    <h5 class="modal-title">Appointment Details
                                    </h5>
                                </div>
                                <div class="col-md-1">
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                            </div>

                            <div class="modal-body">

                                <form id="up_suspend_form">
                                    <div class="row">
                                        <!-- <label class="mt-2">Appointment Details</label> -->
                                        <h5 class="modal-title"><span id="up_dis_error" class="text-danger"></span>
                                        </h5>
                                        <div class="row" id="up_appointmenttype">
                                            <!-- id="up_appointmenttype -->

                                            <label class="mt-2">Type<span class="text-warning">*</span></label>

                                            <div class="mt-2 col-md-6">
                                                <input type="radio" name="up_appointmenttype" value="Walk-in">
                                                <label>Walk-in</label>
                                            </div>

                                            <div class="mt-2 col-md-6">
                                                <input type="radio" name="up_appointmenttype" value="Appointment">
                                                <label>Appointment</label>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="mt-2">Appointment Date<span class="text-warning">*</span></label>
                                                <div class="appt-datetime__input">
                                                    <input type="date" class="form-control" name="up_start" id="up_datefrom">
                                                    <input type="hidden" class="form-control" id="up_id" name="up_id">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="mt-2">Apointment Time<span class="text-warning">*</span></label>
                                                <input type="time" class="form-control" id="up_timestart" name="up_timestart">
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="mt-2">Location<span class="text-warning">*</span></label>

                                                <select class="form-control" id="up_location" name="up_location">
                                                    <option value="">Select Location</option>
                                                    <option value="aeh">AEH</option>
                                                    <option value="aec">AEC</option>
                                                    <option value="saf">SAF</option>

                                                </select>
                                            </div>

                                            <div class="col-md-6">
                                                <label class="mt-2">Consultant<span class="text-warning">*</span></label>

                                                <select class="form-control" id="up_consultant" name="up_consultant">
                                                    <?php if (!empty($result)): ?> 
                                                        <?php foreach ($result as $row):?>
                                                            <option value="<?= $row->name ?>"><?= $row->name ?></option>
                                                        <?php endforeach ?>
                                                        <?php else:?>
                                                            <option value="">No Doctor Available</option>
                                                    <?php endif?>
                                                </select>
                                            </div>

                                            <div class="appt-types">
                                                <div class="appt-types__input">
                                                    <div class="col-md-6">
                                                        <label class="mt-2">Appointment Type<span class="text-warning">*</span></label>

                                                        <select class="form-control" id="up_appointmentreason" name="up_appointmentreason">
                                                            <!-- <option value="review">Review</option>
                                                                <option value="walkin">Walk-In</option> -->
                                                            <option value="consultation">Consultation</option>
                                                            <option value="checkup">Checkup</option>
                                                            <option value="surgery">Surgery</option>

                                                        </select>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label class="mt-2">Categories<span class="text-warning">*</span></label>

                                                        <select class="form-control" id="up_appointmentcategory" name="up_appointmentcategory">
                                                            <option value="none">--Select Appointment Type--</option>
                                                            <option value="comprehensive">Comprehensive</option>
                                                            <option value="routine">Routine</option>
                                                            <option value="lens">Contact Lens</option>
                                                        </select>
                                                    </div>

                                                </div>

                                            </div>

                                            <p class="reservation">Reserved Slot for <span class="reservation_time"></span></p>
                                            <!-- <div class="reservation-container">

                                            </div> -->
                                        </div>
                                    </div>

                                </form>

                            </div>
                            <div class="modal-footer">
                                <button type="button" id="up_save_events" class="btn btn-primary">Save</button>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal" tabindex="-1" id="day_modal">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <h5 class="modal-title"><span id="dis_error_day" class="text-danger"></span></h5> -->
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                                <form id="day_form">
                                    <div class="row">
                                        <!-- <span>Note : <span class="text-warning">*</span> Denoted Field Are Required </span><br> -->
                                        <div class="col-md-12">
                                            <label>Event</label>
                                            <select class="form-control" id="center_name_day">
                                                <option value="">Select event</option>
                                                <option value="Google">Google</option>
                                                <option value="Youtube">Youtube</option>
                                            </select>
                                        </div>

                                        <div class="col-md-12">
                                            <label class="mt-3"> <span>Drag Your Event To Change Date & Time</span></label>

                                        </div>
                                        <input type="hidden" id="daystart" name="">
                                        <input type="hidden" id="dayend" name="">


                                    </div>


                                </form>

                            </div>
                            <div class="modal-footer">
                                <button type="button" id="save_events_day" class="btn btn-primary">Save</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!--Card-body -->
        </div>
        <!-- end main content-->

    </div><!-- container-fluid -->
    <!-- END layout-wrapper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- <script>
        $(document).ready(function() {
            var calendar = $("#calendar").fullCalendar({
                editable: true,
                firstDay: 1,
                defaultView: "month",
                height: 650,
                contentHeight: "auto",
                expandRows: true,
                timeFormat: "h:mm a",
                slotLabelFormat: "h:mm a",
                header: {
                    left: "prev,next today",
                    center: "title",
                    right: "month,agendaWeek,agendaDay",
                },
                views: {
                    agendaWeek: {
                        columnFormat: "ddd D/M",
                    },
                },

                events: "<?php echo base_url(); ?>FullCalendar/load",
                selectable: true,
                selectHelper: true,

                select: function(start, end) {
                    var view = calendar.fullCalendar("getView");

                    if (view.name == "month" || view.name == "agendaWeek") {
                        $("#cal_modal").modal("show");

                        var setstart = $.fullCalendar.formatDate(start, "Y-MM-DD");
                        var setend = $.fullCalendar.formatDate(end, "Y-MM-DD");
                        var setfrom = $.fullCalendar.formatDate(start, "HH:mm:ss");
                        var setto = $.fullCalendar.formatDate(end, "HH:mm:ss");

                        $("#datefrom").val(setstart);
                        $("#dateto").val(setend);
                        $("#timefrom").val(setfrom);
                        $("#timeto").val(setto);
                    } else if (view.name == "agendaDay") {
                        $("#day_modal").modal("show");

                        var start = $.fullCalendar.formatDate(start, "Y-MM-DD HH:mm:ss");
                        var end = $.fullCalendar.formatDate(end, "Y-MM-DD HH:mm:ss");

                        $("#daystart").val(start);
                        $("#dayend").val(end);
                    }
                },

                eventResize: function(event) {
                    if (event.status == 1) {
                        event.draggable = false;
                    } else {
                        var start = $.fullCalendar.formatDate(event.start, "Y-MM-DD HH:mm:ss");
                        var end = $.fullCalendar.formatDate(event.end, "Y-MM-DD HH:mm:ss");

                        var title = event.title;

                        var id = event.id;

                        $.ajax({
                            url: "<?php echo base_url(); ?>FullCalendar/update",
                            type: "POST",
                            data: {
                                title: title,
                                start: start,
                                end: end,
                                id: id,
                            },
                            success: function() {
                                calendar.refetchEvents();
                                Swal.fire({
                                    icon: "success",
                                    title: "Event Updated",
                                    showConfirmButton: false,
                                    timer: 2500,
                                });
                            },
                        });
                    }
                },
                eventDrop: function(event) {
                    var start = $.fullCalendar.formatDate(event.start, "Y-MM-DD HH:mm:ss");
                    var end = $.fullCalendar.formatDate(event.end, "Y-MM-DD HH:mm:ss");
                    var title = event.title;
                    var id = event.id;
                    $.ajax({
                        url: "<?php echo base_url(); ?>FullCalendar/update",
                        type: "POST",
                        data: {
                            title: title,
                            start: start,
                            end: end,
                            id: id,
                        },
                        success: function(data) {
                            calendar.refetchEvents();
                            Swal.fire({
                                icon: "success",
                                title: "Event Updated",
                                showConfirmButton: false,
                                timer: 2500,
                            });
                        },
                    });
                },
                eventClick: function(event) {
                    var id = event.id;
                    $.ajax({
                        url: "<?php echo base_url() ?>FullCalendar/get_cal_data",
                        data: {
                            id: id,
                        },
                        type: "POST",
                        dataType: "json",
                        success: function(data) {
                            $("#up_titles").val(data.title);
                            $("#up_datefrom").val(data.start_date);
                            $("#up_dateto").val(data.end_date);
                            $("#up_timefrom").val(data.start_time);
                            $("#up_timeto").val(data.end_time);
                            $("#up_id").val(data.id);

                            $("#update_cal_modal").modal("show");
                            $("#up_time_error").text(null);
                            $("#time_error").text(null);
                        },
                        error: function() {},
                    });
                },
            });

            $("#save_events_day").click(function() {
                $("#day_modal").modal("show");
                // var a=prompt('a');

                if ($("#center_name_day").val() == "") {
                    $("#dis_error_day").text("Note : All Field Required");
                    return false;
                } else {
                    $("#dis_error_day").text(null);
                    $("#day_modal").modal("hide");

                    var center = $("#center_name_day").val();
                    var start = $("#daystart").val();
                    var end = $("#dayend").val();

                    $.ajax({
                        url: "<?php echo base_url(); ?>FullCalendar/insert_day",
                        type: "POST",
                        data: {
                            title: center,
                            start: start,
                            end: end,
                        },
                        success: function() {
                            $("#day_form")[0].reset();
                            calendar.refetchEvents();
                            Swal.fire({
                                icon: "success",
                                title: "Event Added Successfully",
                                showConfirmButton: false,
                                timer: 2500,
                            });
                        },
                    });
                }
            });
            
    </script> -->
    <script>
        $(document).ready(function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                editable: true,
                firstDay: 1,
                timeZone: 'UTC',
                themeSystem: 'bootstrap5',
                initialView: "dayGridMonth",
                eventTimeFormat: {
                    hour: 'numeric',
                    minute: '2-digit'
                },

                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                },

                expandRows: true,
                height: 600,
                dayMaxEvents: true, // allow "more" link when too many events
                events: "<?php echo base_url(); ?>slots-load",

                selectable: true,
                // selectHelper: true,

                select: function(info) {
                    var view = calendar.view;

                    if (view.type == "dayGridMonth") {

                        $("#cal_modal").modal("show");

                        var setstart = info.startStr;
                        var setfrom = moment(info).format('HH:mm');

                        $("#datefrom").val(setstart);
                        $("#timefrom").val(setfrom);

                    } else if (view.type == "timeGridDay") {
                        $("#day_modal").modal("show");

                        var start = info.startStr;
                        var end = info.endStr;

                        $("#daystart").val(start);
                        $("#dayend").val(end);
                    }
                },

                eventClick: function(info) {

                    var id = info.event.id;

                    $.ajax({
                        url: "<?php echo base_url() ?>get-cell-data",
                        data: {
                            id: id,
                        },
                        type: "POST",
                        dataType: "json",
                        success: function(data) {

                            $("#up_datefrom").val(data[0].start_date);
                            $("#up_timestart").val(data[0].start_time);

                            if (data[0].appointmenttype == 'Walk-in') {
                                $('#up_appointmenttype').find(':radio[name=up_appointmenttype][value=Walk-in]').prop('checked', true)
                                $("#up_appointmenttype").val('Walk-in');
                            } else {
                                $('#up_appointmenttype').find(':radio[name=up_appointmenttype][value=Appointment]').prop('checked', true)
                                $("#up_appointmenttype").val('Appointment');
                            }
                            $("#up_location").val(data[0].location);
                            $("#up_consultant").val(data[0].consultant);
                            $("#up_appointmentreason").val(data[0].appointmentreason);
                            $("#up_appointmentcategory").val(data[0].appointmentcategory);

                            $("#up_id").val(data[0].id);

                            $("#update_cal_modal").modal("show");
                            $("#up_time_error").text(null);
                            $("#time_error").text(null);
                        },
                        error: function() {},
                    });
                },
            });

            $("#save_events_day").click(function() {
                $("#day_modal").modal("show");

                if ($("#center_name_day").val() == "") {
                    $("#dis_error_day").text("Note : All Field Required");
                    return false;
                } else {
                    $("#dis_error_day").text(null);
                    $("#day_modal").modal("hide");

                    var center = $("#center_name_day").val();
                    var start = $("#daystart").val();
                    var end = $("#dayend").val();

                    $.ajax({
                        url: "<?php echo base_url(); ?>update-day",
                        type: "POST",
                        data: {
                            title: center,
                            start: start,
                            end: end,
                        },
                        success: function() {
                            $("#day_form")[0].reset();
                            calendar.refetchEvents();
                            Swal.fire({
                                icon: "success",
                                title: "Event Added Successfully",
                                showConfirmButton: false,
                                timer: 2500,
                            });
                        },
                    });
                }
            });

            //save events by month and by week

            $("#save_events").click(function() {
                if (
                    $("#datefrom").val() == "" ||
                    $("#timestart").val() == "" ||
                    $("#appointmenttype").val() == "" ||
                    $("#location").val() == "" ||
                    $("#consultant").val() == "" ||
                    $("#appointmentreason").val() == "" ||
                    $("#appointmentcategory").val() == ""
                ) {
                    $("#dis_error").text("Note : All Field Required");
                    return false;
                } else {
                    $("#dis_error").text(null);
                    $("#cal_modal").modal("hide");

                    $.ajax({
                        url: "<?php echo base_url(); ?>insert-slot",
                        type: "POST",
                        data: $("#suspend_form").serialize(),
                        success: function() {
                            $("#suspend_form")[0].reset();
                            calendar.refetchEvents();
                            Swal.fire({
                                icon: "success",
                                title: "Event Added Successfully",
                                showConfirmButton: false,
                                timer: 2500,
                            }, function() {
                                location.reload();
                            });
                        },
                    });
                }
            });

            $("#up_save_events").click(function() {
                if (
                    $("#up_datefrom").val() == "" ||
                    $("#up_timestart").val() == "" ||
                    $("#up_appointmenttype").val() == "" ||
                    $("#up_location").val() == "" ||
                    $("#up_consultant").val() == "" ||
                    $("#up_appointmentreason").val() == "" ||
                    $("#up_appointmentcategory").val() == ""
                ) {
                    $('#up_dis_error').text('Note : All Field Required');
                    return false;
                } else {
                    $('#up_dis_error').text(null);
                    $("#update_cal_modal").modal("hide");
                    $.ajax({
                        url: "<?php echo base_url(); ?>up-insert-slot",
                        type: "POST",
                        data: $("#up_suspend_form").serialize(),
                        success: function() {
                            $("#up_suspend_form")[0].reset();
                            calendar.refetchEvents();
                            Swal.fire({
                                icon: "success",
                                title: "Event Updated Successfully",
                                showConfirmButton: false,
                                timer: 2500,
                            });
                        },
                    });
                }
            });

            $("#del").click(function() {
                Swal.fire({
                    title: "Are you sure?",
                    text: "You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Yes, remove it!",
                }).then((result) => {
                    if (result.value) {
                        var id = $("#up_id").val();
                        $.ajax({
                            url: "<?php echo base_url(); ?>delete-slot",
                            type: "POST",
                            data: {
                                id: id,
                            },
                            success: function() {
                                $("#update_cal_modal").modal("hide");
                                calendar.refetchEvents();
                                Swal.fire({
                                    icon: "success",
                                    title: "Event Removed",
                                    showConfirmButton: false,
                                    timer: 2500,
                                });
                            },

                        });
                    }
                });
            });

            calendar.render();
        });
    </script>


</body>

</html>
</body>

</html>