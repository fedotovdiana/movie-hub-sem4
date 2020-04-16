package ru.itis.moviehub.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "checklist_film")
public class ChecklistFilm {
    @Id
    @Column(name = "checklist_id")
    private Long id;
    @Column(name = "film_id")
    private Long filmId;
}
