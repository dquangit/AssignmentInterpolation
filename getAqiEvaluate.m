function [evaluate, warning] = getAqiEvaluate(aqiInput)
        if (aqiInput < 0)
            evaluate = 'Invalid';
            warning = 'Invalid';
        elseif aqiInput <= 50
            evaluate = 'Good';
            warning = 'Air quality is considered satisfactory, and air pollution poses little or no risk';
        elseif aqiInput <= 100
            evaluate = 'Moderate';
            warning = 'Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.';
        elseif aqiInput <= 150
            evaluate = 'Unhealthy for Sensitive Groups';
            warning = 'Members of sensitive groups may experience health effects. The general public is not likely to be affected.';
        elseif aqiInput <= 200
            evaluate = 'Unhealthy';
            warning = 'Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects';
        elseif aqiInput <= 300
            evaluate = 'Very Unhealthy';
            warning = 'Health warnings of emergency conditions. The entire population is more likely to be affected.';
        else
            evaluate = 'Good';
            warning = 'Health alert: everyone may experience more serious health effects.';
        end
end

