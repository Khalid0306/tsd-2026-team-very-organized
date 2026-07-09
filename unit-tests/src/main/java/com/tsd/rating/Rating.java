package com.tsd.rating;

import java.util.ArrayList;
import java.util.List;

/**
 * Simulates the product rating logic that a SauceDemo-like catalog page
 * could use: users submit a star rating (1 to 5) for a product, and the
 * average rating is displayed on the product card.
 */
public class Rating {

    private static final int MIN_RATING = 1;
    private static final int MAX_RATING = 5;

    private final List<Integer> ratings = new ArrayList<>();

    /**
     * Adds a new rating for the product.
     *
     * @param value the rating value, must be between 1 and 5 inclusive
     * @throws IllegalArgumentException if value is outside the 1-5 range
     */
    public void addRating(int value) {
        if (value < MIN_RATING || value > MAX_RATING) {
            throw new IllegalArgumentException(
                    "Rating must be between " + MIN_RATING + " and " + MAX_RATING + ", got: " + value);
        }
        ratings.add(value);
    }

    /**
     * Computes the average of all ratings added so far.
     *
     * @return the average rating
     * @throws IllegalStateException if no rating has been added yet
     */
    public double getAverageRating() {
        if (ratings.isEmpty()) {
            throw new IllegalStateException("Cannot compute average: no rating has been added");
        }
        int sum = 0;
        for (int value : ratings) {
            sum += value;
        }
        return (double) sum / ratings.size();
    }

    public int getRatingCount() {
        return ratings.size();
    }
}
