% Generates all relevant values for the regression side of the project
% Accepts features, hotness, and categories matrix

function [ALL_CROSS_MSE, ALL_WEIGHTS, PER_GENRE_MSE, PER_GENRE_WEIGHTS] = generateFullReport(X, Y, categories)
    
    ALL_CROSS_MSE = CrossValidator(X, Y);
    ALL_WEIGHTS = generateWeights(X, Y);
    
    genreRegression = perGenreRegression(categories, X, Y);
    [PER_GENRE_MSE, PER_GENRE_WEIGHTS] = unpackResults(genreRegression);
end