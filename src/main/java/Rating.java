public class Rating {

    /**
     * Maps a points value (0..100) to a letter grade.
     * Boundaries: A>=93, B>=85, C>=77, D>=69, E>=61, else FX.
     * ACTION (A): verifier les seuils contre l'enonce du Lab 2.
     */
    public String determineResultGrade(int points) {
        if (points < 0 || points > 100) {
            throw new IllegalArgumentException("points must be between 0 and 100");
        }
        if (points >= 93) return "A";
        if (points >= 85) return "B";
        if (points >= 77) return "C";
        if (points >= 69) return "D";
        if (points >= 61) return "E";
        return "FX";
    }
}
