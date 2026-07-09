package com.tsd.rating;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

class RatingTest {

    private Rating rating;

    @BeforeEach
    void setUp() {
        rating = new Rating();
    }

    // --- Positive test ---

    @Test
    void averageOfSeveralValidRatingsIsComputedCorrectly() {
        rating.addRating(4);
        rating.addRating(5);
        rating.addRating(3);

        assertEquals(4.0, rating.getAverageRating(), 0.0001);
    }

    // --- Boundary tests ---

    @Test
    void minimumValidRatingOneIsAccepted() {
        rating.addRating(1);

        assertEquals(1.0, rating.getAverageRating(), 0.0001);
    }

    @Test
    void maximumValidRatingFiveIsAccepted() {
        rating.addRating(5);

        assertEquals(5.0, rating.getAverageRating(), 0.0001);
    }

    @Test
    void ratingOfZeroJustBelowMinimumIsRejected() {
        assertThrows(IllegalArgumentException.class, () -> rating.addRating(0));
    }

    @Test
    void ratingOfSixJustAboveMaximumIsRejected() {
        assertThrows(IllegalArgumentException.class, () -> rating.addRating(6));
    }

    // --- Invalid input ---

    @Test
    void negativeRatingIsRejected() {
        assertThrows(IllegalArgumentException.class, () -> rating.addRating(-3));
    }

    // --- Empty state ---

    @Test
    void computingAverageWithoutAnyRatingThrowsException() {
        assertThrows(IllegalStateException.class, () -> rating.getAverageRating());
    }

    // --- Test intentionally wrong at first (to be fixed) ---
    @Test
    void averageOfTwoRatingsIsCorrectedToExpectedValue() {
        rating.addRating(2);
        rating.addRating(4);

        // Corrigé : la moyenne de (2, 4) est 3.0. La version initiale de ce
        // test attendait 5.0 et échouait volontairement (voir COVERAGE_NOTES.md).
        assertEquals(3.0, rating.getAverageRating(), 0.0001);
    }
}
