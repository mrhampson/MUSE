%Calculate the RMS given predicted values and actual values
function rms = generateRMS(predicted, actual)
    assert(size(predicted,1) == size(actual,1));
    
    rms = 0;
    for i = 1:size(actual,1)
        difference = predicted(i,1) - actual(i,1);
        difference = difference^2;
        rms = rms + difference;
    end
    
    rms = rms / size(actual,1);
end