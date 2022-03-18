library(DeepPINCS)

# ?DeepPINCS::fit_cpi


## ---- eval=TRUE---------------------------------------------------------------
if (keras::is_keras_available() & reticulate::py_available()) {
    library(DeepPINCS)
    example_cpi <- example_cpi[1:500,]
    validation_split <- 0.3
    idx <- sample(seq_len(length(example_cpi[,1])))
    train_idx <- seq_len(length(example_cpi[,1])) %in%
        idx[seq_len(round(length(example_cpi[,1]) * (1 - validation_split)))]
}

## ---- eval=TRUE---------------------------------------------------------------
if (keras::is_keras_available() & reticulate::py_available()) {
    net_args <- list(
        compound = "gcn_in_out",
        compound_args = list(
            gcn_units = c(128, 64),
            gcn_activation = c("relu", "relu"),
            fc_units = c(10),
            fc_activation = c("relu")),
        protein = "cnn_in_out",
        protein_args = list(
            cnn_filters = c(32),
            cnn_kernel_size = c(3),
            cnn_activation = c("relu"),
            fc_units = c(10),
            fc_activation = c("relu")),
        fc_units = c(1),
        fc_activation = c("sigmoid"),
        loss = "binary_crossentropy",
        optimizer = keras::optimizer_adam(),
        metrics = "accuracy")
}

## ---- eval=TRUE---------------------------------------------------------------
if (keras::is_keras_available() & reticulate::py_available()) {
    compound_max_atoms <- 50
    protein_embedding_dim <- 16
    protein_length_seq <- 100
    gcn_cnn_cpi <- fit_cpi(
        smiles = example_cpi[train_idx, 1],
        AAseq = example_cpi[train_idx, 2], 
        outcome = example_cpi[train_idx, 3],
        compound_type = "graph",
        compound_max_atoms = compound_max_atoms,
        protein_length_seq = protein_length_seq,
        protein_embedding_dim = protein_embedding_dim,
        protein_ngram_max = 2,
        protein_ngram_min = 1,
        smiles_val = example_cpi[!train_idx, 1],
        AAseq_val = example_cpi[!train_idx, 2],
        outcome_val = example_cpi[!train_idx, 3],
        net_args = net_args,
        epochs = 20,
        batch_size = 64,
        callbacks = keras::callback_early_stopping(
            monitor = "val_accuracy",
            patience = 10,
            restore_best_weights = TRUE))
    ttgsea::plot_model(gcn_cnn_cpi$model)
}
