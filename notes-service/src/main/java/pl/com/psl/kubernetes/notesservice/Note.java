package pl.com.psl.kubernetes.notesservice;


import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.data.annotation.Id;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
class Note {
    @Id
    private String id;
    private final LocalDateTime timestamp;
    private final String message;
}
