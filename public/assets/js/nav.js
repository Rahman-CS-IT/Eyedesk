//LEFT PATIENT REGISTER NAVBAR
let leftNav = document.querySelectorAll(".modal__container__left__nav__btn"),
	leftNavContent = document.querySelectorAll(".modal__container__left__body");

leftNav.forEach((tab, index) => {
	tab.addEventListener("click", () => {
		leftNavContent.forEach((content) => {
			content.classList.remove("active");
		});
		leftNav.forEach((tab) => {
			tab.classList.remove("active");
		});

		leftNavContent[index].classList.add("active");
		leftNav[index].classList.add("active");
	});
});

//profile Toggle
function profileToggle() {
	const dropDown = document.querySelector(".profile-image__dropdown");
	dropDown.classList.toggle("active");
}

//Patient Registration Toggle
function addPatientToggle() {
	const registerPage = document.querySelector(".patient-registration");
	registerPage.classList.toggle("active");
	if (registerPage.classList.contains("active")) {
		document.body.style.overflow = "hidden";
	} else {
		document.body.style.overflow = "initial";
	}
}

function slotsToggle()
{
	const slots = document.querySelector(".slots-container");
	slots.classList.toggle("active");
	if (slots.classList.contains("active")) {
		document.body.style.overflow = "hidden";
	} else {
		document.body.style.overflow = "initial";
	}
}
// // RESERVED SLOT DATE AND TIME
// let regDate = new Date,
//     regDay = date.getDate(),
//     regMonth = date.getMonth(),
//     regYear = date.getFullYear();

// let reservationTime = document.querySelector('.reservation_time');

// const regMonths = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug','Sep', 'Oct', 'Nov', 'Dec'];

// reservationTime.textContent = regDay + ' ' + regMonths[regMonth] + ', ' + regYear;
// reservationTime.style.color = '#1757C2';

// HISTORY BUTTONS
let optSelectBtn = document.querySelectorAll(
		".history-opthalmic__input__btn-group .selectbtn"
	),
	sytSelectBtn = document.querySelectorAll(
		".history-systemic__input__btn-group .selectbtn"
	),
	nutriSelectBtn = document.querySelectorAll(".box-body-nutrition .selectbtn"),
	normSelectBtn = document.querySelectorAll(".box-body .selectbtn"),
	drugSelectBtn = document.querySelectorAll(
		".allergies-drug__body__btn .selectbtn"
	),
	contactSelectBtn = document.querySelectorAll(
		".allergies-contact__body__btn .selectbtn"
	),
	foodSelectBtn = document.querySelectorAll(
		".allergies-food__body__btn .selectbtn"
	);

//multi select
drugSelectBtn.forEach((tab, index) => {
	// tab.addEventListener('click', () => {
	//     drugSelectBtn.forEach((tab) => {
	//         tab.classList.remove('active');
	//     });
	//     drugSelectBtn[index].classList.add('active');
	// });
	tab.addEventListener("click", () => {
		drugSelectBtn[index].classList.toggle("active");
	});
});

//multi select
contactSelectBtn.forEach((tab, index) => {
	// tab.addEventListener("click", () => {
	// 	contactSelectBtn.forEach((tab) => {
	// 		tab.classList.remove("active");
	// 	});
	// 	contactSelectBtn[index].classList.add("active");
	// });
	tab.addEventListener("click", () => {
		contactSelectBtn[index].classList.toggle("active");
	});
});

//multi select
foodSelectBtn.forEach((tab, index) => {
	// tab.addEventListener("click", () => {
	// 	foodSelectBtn.forEach((tab) => {
	// 		tab.classList.remove("active");
	// 	});
	// 	foodSelectBtn[index].classList.add("active");
	// });
	tab.addEventListener("click", () => {
		foodSelectBtn[index].classList.toggle("active");
	});
});

//multi select
optSelectBtn.forEach((tab, index) => {
	tab.addEventListener("click", () => {
		// optSelectBtn.forEach((tab) => {
		//     tab.classList.remove('active');
		// });
		optSelectBtn[index].classList.toggle("active");
	});
});

//multiselect
sytSelectBtn.forEach((tab, index) => {
	tab.addEventListener("click", () => {
		sytSelectBtn[index].classList.toggle("active");
	});
});

//single select
nutriSelectBtn.forEach((tab, index) => {
	tab.addEventListener("click", () => {
		nutriSelectBtn.forEach((tab) => {
			tab.classList.remove("active");
		});
		nutriSelectBtn[index].classList.add("active");
	});
});

//single select
normSelectBtn.forEach((tab, index) => {
	tab.addEventListener("click", () => {
		normSelectBtn.forEach((tab) => {
			tab.classList.remove("active");
		});
		normSelectBtn[index].classList.add("active");
	});
});
