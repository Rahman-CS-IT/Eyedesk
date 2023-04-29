const leftArrow = document.querySelector(".leftarrow");
const rightArrow = document.querySelector(".rightarrow");
const todaybtn = document.querySelector(".today-btn");

const datePickerElement = document.querySelector(".date-picker");
const selectDateElement = document.querySelector(".date-picker__selected-date");
const datesElement = document.querySelector(".dates");

const monthElement = document.querySelector(".month");
const nextMonthElement = document.querySelector(".nxt-month");
const prevMonthElement = document.querySelector(".prv-month");
const daysElement = document.querySelector(".days");
const calendarIcon = document.querySelector(".scheduler");

const months = [
	"January",
	"February",
	"March",
	"April",
	"May",
	"June",
	"July",
	"August",
	"September",
	"October",
	"November",
	"December",
];

let date = new Date();
let day = date.getDate();
let month = date.getMonth();
let year = date.getFullYear();

let selectedDate = date;
let selectedDay = day;
let selectedMonth = month;
let selectedYear = year;

monthElement.textContent = months[month] + " " + year;

calendarIcon.addEventListener("click", toggleDatePicker);

nextMonthElement.addEventListener("click", goToNextMonth);

prevMonthElement.addEventListener("click", goToPrevMonth);

selectDateElement.textContent = formatDate(date);

populateDates();

function toggleDatePicker() {
	datesElement.classList.toggle("active");
}

function goToNextMonth(event) {
	month++;
	if (month > 11) {
		month = 0;
		year++;
	}
	monthElement.textContent = months[month] + " " + year;
	populateDates();
}

function goToPrevMonth(event) {
	month--;
	if (month < 0) {
		month = 11;
		year--;
	}
	monthElement.textContent = months[month] + " " + year;
	populateDates();
}

function formatDate(d) {
	let day = d.getDate();

	let month = d.getMonth();
	let year = d.getFullYear();

	return day + " " + months[month] + ", " + year;
}

function populateDates(dt) {
	daysElement.innerHTML = "";
	let amountDays = 31;
	if (month == 1) {
		amountDays = 28;
	}
	if (month == 3 || month == 5 || month == 8 || month == 10 || month == 12) {
		amountDays = 30;
	}

	for (let i = 0; i < amountDays; i++) {
		const dayElement = document.createElement("div");
		dayElement.classList.add("day");
		dayElement.textContent = i + 1;

		if (
			selectedDay == i + 1 &&
			selectedYear == year &&
			selectedMonth == month
		) {
			dayElement.classList.add("selected");
		}

		dayElement.addEventListener("click", function () {
			selectedDate = new Date(year + "-" + (month + 1) + "-" + (i + 1));
			selectedDay = i + 1;
			selectedMonth = month;
			selectedYear = year;

			selectDateElement.textContent = formatDate(selectedDate);
			selectDateElement.dataset.value = selectedDate;

			populateDates();
		});

		daysElement.appendChild(dayElement);
	}
	var expDate = new Date("2022-02-20");
	var now = new Date();
	var oneMonthFromNow = new Date(
		now.getFullYear(),
		now.getMonth() + 1,
		now.getDate()
	);
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
	if (month < 0 || month > 11) {
		// if current month is less than 0 or greater than 11
		// creating a new date of current year & month and pass it as date value
		day = new Date(year, month);
		year = date.getFullYear(); // updating current year with new date year
		month = date.getMonth(); // updating current month with new date month
	} else {
		date = new Date(); // pass the current date as date value
	}
	selectDateElement.innerText = day + " " + months[month] + ", " + year; // passing current mon and yr as currentDate text
	// console.log('click');
	// selectDateElement.textContent = formatDate(date);

	// renderCalendar();
});
rightArrow.addEventListener("click", () => {
	// console.log('click');
	day = day + 1;
	if (day > lastDateofMonth) {
		month = month + 1;
		day = firstDateofnextMonth;
	}
	if (month < 0 || month > 11) {
		// if current month is less than 0 or greater than 11
		// creating a new date of current year & month and pass it as date value
		date = new Date(year, month);
		year = date.getFullYear(); // updating current year with new date year
		month = date.getMonth(); // updating current month with new date month
	} else {
		date = new Date(); // pass the current date as date value
	}
	// selectDateElement.textContent = formatDate(date);
	selectDateElement.innerText = day + " " + months[month] + ", " + year; // passing current mon and yr as currentDate text
	populateDates();
});
todaybtn.addEventListener("click", () => {
	let date = new Date(),
		currentYear = date.getFullYear(), // updating current year with new date year
		currMonth = date.getMonth(),
		currentdate = date.getDate();
	// selectDateElement.innerText = ` ${currentdate} ${months[currMonth]}, ${currYear}`; // passing current mon and yr as currentDate text
	selectDateElement.textContent = formatDate(date);

	populateDates();
});


//DASHBOARD left BOX TOGGLE

const toggleBtn = document.querySelectorAll(".box_toggleBtn");
const boxBody = document.querySelectorAll(".box-body");
const box = document.querySelectorAll(".box");

for (let i = 0; i < toggleBtn.length; i++) {
	// console.log(toggleBtn.length);
	toggleBtn[i].addEventListener("click", function () {
		let j = i;
		boxBody[j].classList.toggle("collapse");
		if (boxBody[j].classList.contains("collapse")) {
			box[j].style.height = "50px";
		} else {
			box[j].style.height = "initial";
		}
	});
}

//DASHBOARD Right
const addBtn = document.getElementById("todo-btn");
const todoContainer = document.getElementById("todo-container");
const todoInput = document.getElementById("todo");

document.addEventListener("DOMContentLoaded", getTasks);

addBtn.addEventListener("click", taskGenerate);
todoInput.addEventListener("keypress", taskGenerateKey);

function taskGenerate() {
	const newTask = document.createElement("p");
	newTask.classList.add("task-text");
	newTask.innerText = todoInput.value;
	saveToLocal(todoInput.value);
	todoContainer.appendChild(newTask);
	todoInput.value = "";
	newTask.addEventListener("click", function () {
		newTask.style.textDecoration = "line-through";
		newTask.style.color = "#e60000";
	});

	newTask.addEventListener("dblclick", function () {
		todoContainer.removeChild(newTask);
		removeFromLocal(newTask);
	});
}

function taskGenerateKey(e) {
	if (e.key === "Enter") {
		const newTask = document.createElement("p");
		newTask.classList.add("task-text");
		newTask.innerText = todoInput.value;
		saveToLocal(todoInput.value);
		todoContainer.appendChild(newTask);
		todoInput.value = "";

		newTask.addEventListener("click", function () {
			newTask.style.textDecoration = "line-through";
			newTask.style.color = "#e60000";
		});

		newTask.addEventListener("dblclick", function () {
			todoContainer.removeChild(newTask);
			removeFromLocal(newTask);
		});
	}
}

function saveToLocal(task) {
	let tasks;
	if (localStorage.getItem("tasks") === null) {
		tasks = [];
	} else {
		tasks = JSON.parse(localStorage.getItem("tasks"));
	}
	tasks.push(task);
	localStorage.setItem("tasks", JSON.stringify(tasks));
}

function getTasks() {
	let tasks;
	if (localStorage.getItem("tasks") === null) {
		tasks = [];
	} else {
		tasks = JSON.parse(localStorage.getItem("tasks"));
	}
	tasks.forEach(function (task) {
		const newTask = document.createElement("p");
		newTask.classList.add("task-text");
		newTask.innerText = task;
		todoContainer.appendChild(newTask);
		newTask.addEventListener("click", function () {
			newTask.style.textDecoration = "line-through";
			newTask.style.color = "#e60000";
		});

		newTask.addEventListener("dblclick", function () {
			todoContainer.removeChild(newTask);
			removeFromLocal(newTask);
		});
	});
}

function removeFromLocal(task) {
	let tasks;
	let taskList = document.getElementsByClassName("task-text");
	if (localStorage.getItem("tasks") === null) {
		tasks = [];
	} else {
		tasks = JSON.parse(localStorage.getItem("tasks"));
	}
	const taskText = task.innerText;
	tasks.splice(tasks.indexOf(taskText), 1);
	localStorage.setItem("tasks", JSON.stringify(tasks));
}



function rightProfileToggle(){
    const rightPage = document.querySelector(".right");
	rightPage.style.display = "block";
	// rightPage.body.style.overflow  = "initial";
	// rightPage.classList.toggle("active");
	// if (rightPage.classList.contains("active")) {
	// 	document.body.style.overflow = "hidden";
	// } else {
	// 	document.body.style.overflow = "initial";
	// }
}
