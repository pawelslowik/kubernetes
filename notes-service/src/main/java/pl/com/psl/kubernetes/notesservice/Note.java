package pl.com.psl.kubernetes.notesservice;


import lombok.Data;
import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

@Data
class Note {
    @Id
    private String id;
    private LocalDateTime timestamp;
    private String message;
}
