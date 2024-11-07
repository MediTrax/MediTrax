package custom

import (
	"errors"
	"io"
	"strconv"
	"time"

	"github.com/99designs/gqlgen/graphql"
)

func MarshalDateTime(t time.Time) graphql.Marshaler {
	if t.IsZero() {
		return graphql.Null
	}

	return graphql.WriterFunc(func(w io.Writer) {
		io.WriteString(w, strconv.Quote(t.Format("2006-01-02T15:04:05.000")))
	})
}

func UnmarshalDateTime(v interface{}) (time.Time, error) {
	if tmpStr, ok := v.(string); ok {
		return time.Parse("2006-01-02T15:04:05.000", tmpStr)
	}
	return time.Time{}, errors.New("time should be RFC3339Nano formatted string")
}
