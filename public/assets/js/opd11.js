const currentDate = document.querySelector("#current_date"),
prevIcon = document.querySelector("#prev"),
nextIcon = document.querySelector("#next");





// getting new date, current year and month
let date = new Date(),
currYear = date.getFullYear(),
currMonth = date.getMonth(),
currentdate = date.getDate();
const firstDayofMonth = new Date(currYear, currMonth, 1).getDay(), // getting first day of month
    lastDateofMonth = new Date(currYear, currMonth + 1, 0).getDate(), // getting last date of month
    lastDayofMonth = new Date(currYear, currMonth, lastDateofMonth).getDay(), // getting last day of month
    lastDateofLastMonth = new Date(currYear, currMonth, 0).getDate(); 
    firstDateofnextMonth = new Date(currYear,currMonth,1).getDate();


// storing full name of all months in array
const months = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July",
              "Aug", "Sept", "Oct", "Nov", "Dec"];

const renderCalendar = () => {
    currentDate.innerText = `${months[currMonth]} ${currentdate} , ${currYear}`; // passing current mon and yr as currentDate text
}
renderCalendar();   
prevIcon.addEventListener("click",() => {
    currentdate = currentdate - 1;
    // renderCalendar();   
    if(currentdate < 0){
        currentdate = lastDateofLastMonth;
        currMonth = currMonth -1;
    }
    if(currMonth < 0 || currMonth > 11) { // if current month is less than 0 or greater than 11
    // creating a new date of current year & month and pass it as date value
        date = new Date(currYear, currMonth);
        currYear = date.getFullYear(); // updating current year with new date year
        currMonth = date.getMonth(); // updating current month with new date month
        } else {
            date = new Date(); // pass the current date as date value
        }
    renderCalendar(date);

})
nextIcon.addEventListener("click",() => {
    currentdate = currentdate +1;
    if(currentdate > lastDateofMonth){
        currMonth = currMonth +1;
        currentdate = firstDateofnextMonth;
    
    }
    if(currMonth < 0 || currMonth > 11) { // if current month is less than 0 or greater than 11
        // creating a new date of current year & month and pass it as date value
            date = new Date(currYear, currMonth);
            currYear = date.getFullYear(); // updating current year with new date year
            currMonth = date.getMonth(); // updating current month with new date month
            } else {
                date = new Date(); // pass the current date as date value
            }
    renderCalendar();
})
// const dt = new Date(),
// cy = dt.getFullYear(),
// cm = dt.getMonth(),
// cd = dt.getDate();

const todayButton = document.querySelector("#td_btn");
todayButton.addEventListener("click",() =>{
            let date = new Date(),
            currYear = date.getFullYear(), // updating current year with new date year
            currMonth = date.getMonth(),
            currentdate = date.getDate();
            currentDate.innerText = `${months[currMonth]} ${currentdate} , ${currYear}`; // passing current mon and yr as currentDate text

    // console.log(currentdate)

})




    
let daysTag = document.querySelector(".days"),
currentD = document.querySelector(".current-date"),
prevNextIcon = document.querySelectorAll(".icons span");

// getting new date, current year and month
// let date = new Date(),
// currYear = date.getFullYear(),
// currMonth = date.getMonth();

// storing full name of all months in array
let mon = ["January", "February", "March", "April", "May", "June", "July",
              "August", "September", "October", "November", "December"];
              
              const Calendar = () => {
                  let firstDayofMonth = new Date(currYear, currMonth, 1).getDay(), // getting first day of month
                  lastDateofMonth = new Date(currYear, currMonth + 1, 0).getDate(), // getting last date of month
                  lastDayofMonth = new Date(currYear, currMonth, lastDateofMonth).getDay(), // getting last day of month
                  lastDateofLastMonth = new Date(currYear, currMonth, 0).getDate(); // getting last date of previous month
                  let liTag = "";
                  
                  for (let i = firstDayofMonth; i > 0; i--) { // creating li of previous month last days
                    liTag += `<li class="inactive">${lastDateofLastMonth - i + 1}</li>`;
                }
                
                for (let i = 1; i <= lastDateofMonth; i++) { // creating li of all days of current month
                    // adding active class to li if the current day, month, and year matched
                    let isToday = i === date.getDate() && currMonth === new Date().getMonth() 
                    && currYear === new Date().getFullYear() ? "active" : "";
                    liTag += `<li class="${isToday}">${i}</li>`;
                }
                
                for (let i = lastDayofMonth; i < 6; i++) { // creating li of next month first days
                    liTag += `<li class="inactive">${i - lastDayofMonth + 1}</li>`
                }
                currentD.innerText = `${mon[currMonth]} ${currYear}`; // passing current mon and yr as currentDate text
                daysTag.innerHTML = liTag;
}
Calendar();

prevNextIcon.forEach(icon => { // getting prev and next icons
    icon.addEventListener("click", () => { // adding click event on both icons
        // if clicked icon is previous icon then decrement current month by 1 else increment it by 1
        currMonth = icon.id === "prev" ? currMonth - 1 : currMonth + 1;
        // console.log('click')
        
        if(currMonth < 0 || currMonth > 11) { // if current month is less than 0 or greater than 11
            // creating a new date of current year & month and pass it as date value
            date = new Date(currYear, currMonth);
            currYear = date.getFullYear(); // updating current year with new date year
            currMonth = date.getMonth(); // updating current month with new date month
        } else {
            date = new Date(); // pass the current date as date value
        }
        Calendar(); // calling renderCalendar function
    });
});

// const list = document.querySelector('.row');
// list.addEventListener('click', () =>{
//     document.querySelectorAll('.main .right').style.dispaly = block;

// })

const list = document.querySelector('.row');
list.addEventListener('click' ,() =>{
        document.querySelector('.main .right').style.display = 'block';
        // var p = document.querySelector('.p_name').ariaValueMax;
        // console.log(p);
        // wrapper.show();
    
})
// const right = document.querySelectorAll('.main .right')
const print_btn = document.querySelector('#print_btn');
print_btn.addEventListener('click', print)

function print()
{
    var body = document.querySelector('body').innerHTML;
    // alert(body);
    var report = document.querySelector('.main right').innerHTML;
    document.querySelector('body').innerHTML = report;
    window.print();
}

// const add_btn = document.querySelector('#add_btn');
// add_btn.addEventListener('click' , () => {
//     window.location.href = "base_url('../aplication/Welcome/dashboard')";
// })

const submit_btn = document.querySelector('.submit_btn');

submit_btn.addEventListener('click' , () =>{
    console.log('click');
    document.querySelector('.form1').submit();
    document.querySelector('.form2').submit();
})


