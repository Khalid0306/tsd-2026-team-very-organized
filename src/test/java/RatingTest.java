import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

// Lab 2 : ecrire AU MOINS 6 tests, dont limites (boundary) + inputs invalides,
// ET au moins UN test qui echoue expres (pour la preuve), puis run avec coverage.
class RatingTest {

    private final Rating rating = new Rating();

    @Test
    void shouldReturnAForUpperBound() { assertEquals("A", rating.determineResultGrade(100)); }

    @Test
    void shouldReturnAForLowerBoundOfA() { assertEquals("A", rating.determineResultGrade(93)); }

    @Test
    void shouldReturnFXForZero() { assertEquals("FX", rating.determineResultGrade(0)); }

    @Test
    void shouldRejectNegativeInput() {
        assertThrows(IllegalArgumentException.class, () -> rating.determineResultGrade(-1));
    }

    // TODO(A): ajouter au moins 2 tests de plus (autres limites: 60/61, 84/85 ...).

    // TODO(A): le test qui echoue expres. Decommente, capture le rouge pour la preuve,
    //          puis corrige ou documente. Le lab exige "at least one failing test demonstrated".
    // @Test
    // void deliberatelyFailing() { assertEquals("A", rating.determineResultGrade(60)); }
}
