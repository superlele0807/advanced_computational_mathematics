global leapYearOfMonthDayArray nonLeapYearOfMonthDayArray refDay refMonth refYear refWeekday days;

% Define two array to store the days of leap year in each month and the days of non-leap year in each month 
leapYearOfMonthDayArray = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
nonLeapYearOfMonthDayArray = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

days = {'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'};

% Reference date: January 1, 2000 (Saturday)
refDay = 1;
refMonth = 1;
refYear = 2000;
refWeekday = 7;

monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

function dayOfWeek = calculateSpecificDay(day, month, year)
    global leapYearOfMonthDayArray nonLeapYearOfMonthDayArray refDay refMonth refYear refWeekday days;

    % Check if some basic conditions
    if ~isnumeric(day) || ~isnumeric(month) || ~isnumeric(year) || day < 1 || day > 31 || month < 1 || month > 12 || year < 0
        error('Error:You need to input the correct date!');
    end
    
    % Make sure which array should be choose
    if ~checkIfLeapYear(year)
        monthDayArray = nonLeapYearOfMonthDayArray;
    else
        monthDayArray = leapYearOfMonthDayArray;
    end
    
    % Check if day is valid for the month
    if ~(day <= monthDayArray(month))
        error('Error:this date does not exist');
    end
    
    
    % Calculate days between the input date and reference date
    totalDays = abs(calculateDaysBetweenDates(refDay, refMonth, refYear, day, month, year));


    % We need to pay attention to the situation like the given date is
    % earlier than reference date
    if (year < refYear) || (year == refYear && month < refMonth) || (year == refYear && month == refMonth && day < refDay)
        sign = -1;
    else
        sign = 1;
    end
    
    % Calculate the day of the week (mod 7 arithmetic)
    weekdayNum = mod(refWeekday + sign * totalDays - 1, 7) + 1;
    
    % Transfer to corresponding name
    dayOfWeek = days{weekdayNum};
end

% check if a year is a leap year
function leap = checkIfLeapYear(year)
    leap = (mod(year, 4) == 0 && mod(year, 100) ~= 0) || (mod(year, 400) == 0);
end

function days = calculateDaysBetweenDates(d1, m1, y1, d2, m2, y2)
    % Make sure date1 is earlier than date2, otherwise swap
    if y1 > y2 || (y1 == y2 && m1 > m2) || (y1 == y2 && m1 == m2 && d1 > d2)
        days = -calculateDaysBetweenDates(d2, m2, y2, d1, m1, y1);
        return;
    end
    
    % Case when both dates are in the same year
    if y1 == y2
        days = calculateDaysToTargetDate(d2, m2, y2) - calculateDaysToTargetDate(d1, m1, y1);
        return;
    end

    % Remaining days in the first year
    days = calculateDaysInYear(y1) - calculateDaysToTargetDate(d1, m1, y1);
    
    % Full years in between
    for y = y1+1:y2-1
        % calculate the number of days in a given year
        days = days + calculateDaysInYear(y);
    end

    % Remaining days in the last year
    remainingDaysInLastYear = calculateDaysToTargetDate(d2, m2, y2);

    days = days + remainingDaysInLastYear;           
    
end


function days = calculateDaysInMonth(month, year)
    global leapYearOfMonthDayArray nonLeapYearOfMonthDayArray
    
    % Make sure which array should be choose
    if ~checkIfLeapYear(year)
        monthDayArray = nonLeapYearOfMonthDayArray;
    else
        monthDayArray = leapYearOfMonthDayArray;
    end
    
    days = monthDayArray(month);
end

function days = calculateDaysToTargetDate(day, month, year)
    days = day;
    for m = 1:month-1
        days = days + calculateDaysInMonth(m, year);
    end
end

% Get the number of days in a given year
function days = calculateDaysInYear(year)
    if checkIfLeapYear(year)
        days = 366;
    else
        days = 365;
    end
end


% Make some test cases to test
disp(calculateSpecificDay(1, 1, 2000));
disp(days(weekday('1-Jan-2000')));

disp(calculateSpecificDay(23, 2, 2025));
disp(days(weekday('23-Feb-2025')));

disp(calculateSpecificDay(25, 12, 2023));
disp(days(weekday('25-Dec-2023')));

disp(calculateSpecificDay(7, 8, 1995));
disp(days(weekday('7-Aug-1995')));
