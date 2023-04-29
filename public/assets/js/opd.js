const leftArrow = document.querySelector('.leftarrow');
const rightArrow = document.querySelector('.rightarrow');
const todaybtn = document.querySelector('.today-btn');


const datePickerElement = document.querySelector('.date-picker');
const selectDateElement = document.querySelector('.date-picker__selected-date');
const datesElement = document.querySelector('.dates');

const monthElement = document.querySelector('.month');
const nextMonthElement = document.querySelector('.nxt-month');
const prevMonthElement = document.querySelector('.prv-month');
const daysElement = document.querySelector('.days');
const calendarIcon = document.querySelector('.scheduler')

const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August','September', 'October', 'November', 'December'];

let date = new Date();
let day = date.getDate();
let month = date.getMonth();
let year = date.getFullYear();

let selectedDate = date;
let selectedDay = day;
let selectedMonth = month;
let selectedYear = year;

monthElement.textContent = months[month] + ' '+ year;

calendarIcon.addEventListener('click', toggleDatePicker);

nextMonthElement.addEventListener('click', goToNextMonth);

prevMonthElement.addEventListener('click', goToPrevMonth);

selectDateElement.textContent = formatDate(date);

populateDates();

function toggleDatePicker(){
    datesElement.classList.toggle('active');
}

function goToNextMonth(event){
    month++;
    if(month > 11){
        month = 0;
        year++;
    }
    monthElement.textContent = months[month] + ' '+ year;
    populateDates();
}

function goToPrevMonth(event){
    month--;
    if(month < 0){
        month = 11;
        year--;
    }
    monthElement.textContent = months[month] + ' '+ year;
    populateDates();
}

function formatDate(d){
    let day = d.getDate();
    if(day < 10){
        day = '0' + day;
    }

    let month = d.getMonth();
    let year = d.getFullYear();

    return day + ' ' + months[month] + ' ' + year;
}

function populateDates(dt){
    daysElement.innerHTML = '';
    let amountDays = 31;
    if(month == 1){
        amountDays = 28;
    }
    if( month == 3 || month == 5 || month == 8 || month == 10){
        amountDays = 30;
    }

    for (let i = 0; i < amountDays; i++){
        const dayElement = document.createElement('div');
        dayElement.classList.add('day');
        dayElement.textContent = i + 1;

        if(selectedDay == (i + 1) && selectedYear == year && selectedMonth == month){
            dayElement.classList.add('selected');
        }

        dayElement.addEventListener('click', function(){
            selectedDate = new Date(year + '-' + (month + 1) + '-' + (i + 1));
            selectedDay = (i + 1);
            selectedMonth = month;
            selectedYear = year;

            selectDateElement.textContent = formatDate(selectedDate);
            selectDateElement.dataset.value = selectedDate;

            populateDates();
        });

        daysElement.appendChild(dayElement);
    }
}

const firstDayofMonth = new Date(year, month, 1).getDay(), // getting first day of month
lastDateofMonth = new Date(year, month + 1, 0).getDate(), // getting last date of month
lastDayofMonth = new Date(year, month, lastDateofMonth).getDay(), // getting last day of month
lastDateofLastMonth = new Date(year, month, 0).getDate();
firstDateofnextMonth = new Date(year, month, 1).getDate();


leftArrow.addEventListener("click", () => {
day = day - 1;
// renderCalendar();   
if (day <= 0) {
    day = lastDateofLastMonth;
    month = month - 1;
}
if (month < 0 || month > 11) { // if current month is less than 0 or greater than 11
    // creating a new date of current year & month and pass it as date value
    day = new Date(year, month);
    year = date.getFullYear(); // updating current year with new date year
    month = date.getMonth(); // updating current month with new date month
} else {
    date = new Date(); // pass the current date as date value
}
selectDateElement.innerText = day + ' ' + months[month] + ', ' + year; // passing current mon and yr as currentDate text
// console.log('click');
// selectDateElement.textContent = formatDate(date);

// renderCalendar();

})
rightArrow.addEventListener("click", () => {
// console.log('click');
day = day + 1;
if (day > lastDateofMonth) {
    month = month + 1;
    day = firstDateofnextMonth;
}
if (month < 0 || month > 11) { // if current month is less than 0 or greater than 11
    // creating a new date of current year & month and pass it as date value
    date = new Date(year, month);
    year = date.getFullYear(); // updating current year with new date year
    month = date.getMonth(); // updating current month with new date month
} else {
    date = new Date(); // pass the current date as date value
}
// selectDateElement.textContent = formatDate(date);
selectDateElement.innerText = day + ' ' + months[month] + ', ' + year; // passing current mon and yr as currentDate text
populateDates();
})
todaybtn.addEventListener("click", () => {
let date = new Date(),
    currentYear = date.getFullYear(), // updating current year with new date year
    currMonth = date.getMonth(),
    currentdate = date.getDate();
// selectDateElement.innerText = ` ${currentdate} ${months[currMonth]}, ${currYear}`; // passing current mon and yr as currentDate text
selectDateElement.textContent = formatDate(date);

populateDates();
})
const list = document.querySelector('.row');
list.addEventListener('click' ,() =>{
    // list.classList.toggle('active');
        document.querySelector('.main .right').style.display = "block";

})

