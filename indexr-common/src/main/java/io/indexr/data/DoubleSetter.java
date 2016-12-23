package io.indexr.data;

@FunctionalInterface
public interface DoubleSetter {
    /**
     * Specify <code>id</code> with <code>value</code>.
     *
     * @param id    The object index.
     * @param value The object value.
     */
    void set(int id, double value);
}
