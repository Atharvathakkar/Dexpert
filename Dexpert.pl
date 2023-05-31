% Define the symptoms
symptom(fever).
symptom(cough).
symptom(headache).
symptom(sore_throat).
symptom(rash).
symptom(fatigue).
symptom(joint_pain).
symptom(muscle_pain).

% Define the diseases and their associated symptoms
disease(cold, [cough, headache, sore_throat]).
disease(influenza, [fever, cough, headache, fatigue]).
disease(tonsillitis, [fever, sore_throat]).
disease(measles, [fever, cough, rash]).
disease(dengue, [fever, joint_pain, muscle_pain]).
disease(chronic_fatigue_syndrome, [fatigue, muscle_pain]).

% Define the rules for diagnosis
diagnose(Disease) :-
    disease(Disease, Symptoms),
    check_symptoms(Symptoms).

% Check if all the symptoms are present
check_symptoms([]).
check_symptoms([Symptom | Rest]) :-
    symptom(Symptom),
    check_symptoms(Rest).

% Provide possible diagnoses based on symptoms
possible_diagnoses(Symptoms, Diagnoses) :-
    findall(Disease, (disease(Disease, DiseaseSymptoms), subset(DiseaseSymptoms, Symptoms)), Diagnoses).

% Check if a list is a subset of another list
subset([], _).
subset([X|Xs], Set) :-
    member(X, Set),
    subset(Xs, Set).

% Query the expert system for a diagnosis
% ?- possible_diagnoses([fever, cough, headache], Diagnoses).



