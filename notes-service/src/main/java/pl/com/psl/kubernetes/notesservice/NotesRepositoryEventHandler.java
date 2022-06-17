package pl.com.psl.kubernetes.notesservice;

import lombok.extern.slf4j.Slf4j;
import org.springframework.data.rest.core.annotation.*;
import org.springframework.stereotype.Component;

@RepositoryEventHandler
@Component
@Slf4j
public class NotesRepositoryEventHandler {

    @HandleBeforeSave
    public void handleBeforeSave(Note note) {
        log.info("Saving note={}", note);
    }

    @HandleAfterSave
    public void handleAfterSave(Note note) {
        log.info("Saved note={}", note);
    }

    @HandleBeforeCreate
    public void handleBeforeCreate(Note note) {
        log.info("Creating note={}", note);
    }

    @HandleAfterCreate
    public void handleAfterCreate(Note note) {
        log.info("Created note={}", note);
    }

    @HandleBeforeDelete
    public void handleBeforeDelete(Note note) {
        log.info("Deleting note={}", note);
    }

    @HandleAfterDelete
    public void handleAfterDelete(Note note) {
        log.info("Deleted note={}", note);
    }
}
