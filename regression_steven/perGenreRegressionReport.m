% Will generate the graphs for the results of the perGenreRegression

function perGenreRegressionReport(results)
    numResults = size(results, 1);
    l = [];
    for i = 1:numResults
        plot(results(i,1).weights);
        hold on;
    end
    xlabel('feature');
    ylabel('weight');
    hold off;
end